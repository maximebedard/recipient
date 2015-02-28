FactoryGirl.define do
  factory :recipe_ingredient do
    quantity   { Unitwise(1000, 'g') }
    recipe
    ingredient
  end
end
