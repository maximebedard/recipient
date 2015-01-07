FactoryGirl.define do
  factory :ingredient do
    name 'Orange'
    photo         { File.open("#{Rails.root}/spec/fixtures/orange.jpg") }

    calories      { Unitwise(47, 'C') }
    serving       { Unitwise(100, 'g') }

    # Food components
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

    after(:create) do |ingredient|
      ingredient.tags << FactoryGirl.create(:tag)
    end
  end
end
