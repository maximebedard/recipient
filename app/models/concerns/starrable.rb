module Starrable
  extend ActiveSupport::Concern

  included do
    has_many :starreds, through: :starrings
  end

  def star(_user)
    # starreds << Starred.first_or_create!(user: user)
  end

  def unstar(_user)
    #
  end
end
