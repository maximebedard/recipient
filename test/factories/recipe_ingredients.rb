FactoryGirl.define do
  factory :recipe_ingredient do
    quantity   { Unitwise(1000, 'g') }
    recipe     { FactoryGirl.create :recipe }
    ingredient { FactoryGirl.create :ingredient }
  end
end
