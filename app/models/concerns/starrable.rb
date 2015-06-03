module Starrable
  extend ActiveSupport::Concern

  included do
    has_many :stars, as: :starrable, dependent: :destroy
    has_many :watchers, as: :users, through: :stars
  end

  def starred(user)
    stars.first_or_create!(user: user)
  end

  def unstarred(user)
    stars.where(user: user).destroy_all
  end

  def starred?(user)
    @_starred ||= stars.where(user: user).first.present?
  end

  def toggle_starred(user)
    if starred?(user)
      unstarred(user)
    else
      starred(user)
    end
  end
end
