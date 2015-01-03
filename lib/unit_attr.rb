module Recipient
  module Unit
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def unit(name, options = {})
        define_getter(name, options)
        define_setter(name, options)
        add_callbacks(name, options)
      end

      private

      # Defines the getter for the unit
      # => returns a Unitwise::Mesurement with the
      # field :attr_value and :attr_unit
      def define_getter(name, _options = {})
        define_method(name) do
          Unitwise(send("#{name}_value"), send("#{name}_unit"))
        end
      end

      # Defines a setter for the unit
      # Sets :attr_value and :attr_unit from the Unitwise::Mesurement
      def define_setter(name, _options = {})
        define_method("#{name}=") do |value|
          send "#{name}_value=", value.value
          send "#{name}_unit=", value.unit.to_s
        end
      end

      def add_callbacks(name, options = {})
        return unless options.key?(:convert_to)
        before_save do
          send(name).convert_to(options[:convert_to])
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Recipient::Unit
