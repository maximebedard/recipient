module Starrable
  included do
    has_many :starrings, as: :starrable, dependent: :destroy
    has_many :starreds, through: :starrings
  end
end
