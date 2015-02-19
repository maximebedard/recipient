class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :starrable, polymorphic: true

  validates_uniqueness_of :user_id, scope: [:starrable_id, :starrable_type]
  validates_presence_of :user, :starrable
end
