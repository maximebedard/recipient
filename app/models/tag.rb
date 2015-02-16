class Tag < ActiveRecord::Base
  has_many :taggings

  validates_presence_of :name, :color
  before_validation :generate_random_color, on: :create

  private

  def generate_random_color
    self.color ||= ColorFactory.create_random_pastel.to_hex
  end
end
