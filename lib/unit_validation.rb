module Recipient
  module Validators
    included do
    end

    module ClassMethods

      def validates_unit(*attributes)
        # TODO
      end

    end
  end
end

ActiveRecord::Base.send :include, Recipient::Validators