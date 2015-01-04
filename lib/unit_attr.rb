module Recipient
  class UnitAttr
    def self.define_on(klass, name, options)
      new(klass, name, options).define
    end

    def initialize(klass, name, options)
      @klass = klass
      @name = name
      @options = options
    end

    def define
      define_getter
      define_setter
      define_callback
    end

    private

    # Defines the getter for the unit
    # => returns a Unitwise::Mesurement with the field :attr_value and :attr_unit
    def define_getter
      name = @name
      @klass.send :define_method, name.to_s do
        Unitwise(send("#{name}_value"), send("#{name}_unit"))
      end
    end

    # Defines a setter for the unit
    # Sets :attr_value and :attr_unit from the Unitwise::Mesurement
    def define_setter
      name = @name
      @klass.send :define_method, "#{name}=" do |unit|
        send "#{name}_value=", unit.value
        send "#{name}_unit=", unit.unit.to_s
      end
    end

    def define_callback
      options = @options
      name = @name
      return unless options.key? :convert_to
      @klass.send :before_save do
        send("#{name}=", send(name).convert_to(options[:convert_to]))
      end
    end
  end

  module Unit
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def unit(name, options = {})
        UnitAttr.define_on(self, name, options)
      end
    end
  end
end

ActiveRecord::Base.send :include, Recipient::Unit
