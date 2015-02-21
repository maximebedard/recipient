class Instruction < ActiveRecord::Base
  validates :order, :description, presence: true
end
