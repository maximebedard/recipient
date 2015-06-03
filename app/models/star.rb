class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :starrable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:starrable_id, :starrable_type] }
  validates :user, :starrable, presence: true

  scope :users, -> { where(starrable_type: User.class.to_s) }
  scope :recipes, -> { where(starrable_type: User.class.to_s) }
end
