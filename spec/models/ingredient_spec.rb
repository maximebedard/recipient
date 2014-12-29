require 'rails_helper'

RSpec.describe Ingredient, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:resource) { FactoryGirl.create :ingredient }
  let(:quantity) { Unitwise(10, 'g') }

  it '#calories' do
    resource.calories = quantity
    expect(resource.calories_value).to eq(10)
    expect(resource.calories_unit).to eq('g')
    expect(resource.calories).to eq(quantity)
  end
  
end
