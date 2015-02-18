module Starrable
  extend ActiveSupport::Concern

  included do
    has_many :stars, as: :starrable
    has_many :watchers, as: :users, through: :stars
  end

  def star(user)
    stars.first_or_create!(user: user)
  end

  def unstar(user)
    stars.first_or_delete!(user: user)
  end

  def starred?(user)
    stars.where(user: user).first?
  end
end
