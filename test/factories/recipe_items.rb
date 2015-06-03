FactoryGirl.define do
  factory :recipe_item do
    quantity   { Unitwise(1000, 'g') }
    recipe
    ingredient
  end
end
