FactoryGirl.define do
  factory :ingredient do
    name 'Orange'

    serving_value 180
    serving_unit 'g'

    calories_value 80.0
    calories_unit 'g'
    calories_daily_value 0.04

    carbohydrates_value 21.1
    carbohydrates_unit 'g'
    carbohydrates_daily_value 0.07

    fat_value 0.2
    fat_unit 'g'
    fat_daily_value 0.00

    proteins_value 1.7
    proteins_unit 'g'
    proteins_daily_value 0.03
  end

end
