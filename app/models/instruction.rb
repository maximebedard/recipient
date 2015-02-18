class Instruction < ActiveRecord::Base
  validates_presence_of :order, :description
end
