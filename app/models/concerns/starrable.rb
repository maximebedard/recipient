module Starrable
  extend ActiveSupport::Concern

  included do
    has_many :starreds, through: :starrings
  end

  def star
  end

  def unstar
  end
end
