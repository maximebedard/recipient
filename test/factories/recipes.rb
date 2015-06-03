FactoryGirl.define do
  factory :recipe do
    name 'Fresh Orange and Yogurt Tart'
    description 'This sunny tart, with its Greek-yogurt filling' \
                'and almond crust, makes a crowd-pleasing brunch dish. Be ' \
                'sure to save the leftover rinds to make Candied Citrus Peel.'
    published true
    serving       { Unitwise(100, 'g') }
    # Food components
    calories      { Unitwise(47, 'J') }
    fat           { Unitwise(0.1, 'g') }
    saturated_fat { Unitwise(0, 'g') }
    trans_fat     { Unitwise(0, 'g') }
    cholesterol   { Unitwise(0, 'mg') }
    sodium        { Unitwise(0, 'mg') }
    carbohydrate  { Unitwise(12, 'g') }
    fibre         { Unitwise(2.4, 'g') }
    vitamin_a     { Unitwise(225, 'IU') }
    vitamin_c     { Unitwise(69, 'mg') }
    calcium       { Unitwise(40, 'mg') }
    iron          { Unitwise(0.1, 'mg') }
    sugar         { Unitwise(9, 'g') }
    protein       { Unitwise(0.9, 'g') }
  end
end
