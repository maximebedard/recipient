FactoryGirl.define do
  factory :recipe_ingredient do
    quantity   { Unitwise(100, 'g') }
    recipe     { FactoryGirl.create :recipe }
    ingredient { FactoryGirl.create :ingredient }
  end
end
