class Ingredient < ActiveRecord::Base
  include Taggable

  # Daily value constants based n a 2000 calories diet.
  # http://www.fda.gov/food/guidanceregulation/guidancedocumentsregulatoryinformation/labelingnutrition/ucm064928.htm
  DAILY_VALUE = {
    fat:                      Unitwise(65, 'g'),
    saturated_and_trans_fats: Unitwise(20, 'g'),
    cholesterol:              Unitwise(300, 'mg'),
    sodium:                   Unitwise(2400, 'mg'),
    carbohydrate:             Unitwise(300, 'g'),
    fibre:                    Unitwise(25, 'g'),
    vitamin_a:                Unitwise(5000, 'IU'),
    vitamin_c:                Unitwise(60, 'mg'),
    calcium:                  Unitwise(1100, 'mg'),
    iron:                     Unitwise(14, 'mg')
  }

  # Photo uploader (carrierware)
  mount_uploader :photo, PhotoUploader

  # Calculating units
  unit_for :calories, :serving

  # ref : http://www.inspection.gc.ca/food/labelling/food-labelling-for-industry/nutrition-labelling/information-within-the-nutrition-facts-table/eng/1389198568400/1389198597278?chap=1
  # Nutrients
  unit_for :fat,           convert_to: 'g'
  unit_for :saturated_fat, convert_to: 'g'
  unit_for :trans_fat,     convert_to: 'g'
  unit_for :cholesterol,   convert_to: 'mg'
  unit_for :sodium,        convert_to: 'mg'
  unit_for :carbohydrate,  convert_to: 'g'
  unit_for :fibre,         convert_to: 'g'
  unit_for :sugar,         convert_to: 'g'
  unit_for :protein,       convert_to: 'g'
  unit_for :vitamin_a,     convert_to: 'IU'
  unit_for :vitamin_c,     convert_to: 'mg'
  unit_for :calcium,       convert_to: 'mg'
  unit_for :iron,          convert_to: 'mg'

  validates_presence_of :name
  validates_uniqueness_of :name

  # Validate compatibility of nutrients

  def saturated_and_trans_fats
    saturated_fat + trans_fat
  end

  def daily_value_of(nutrient)
    return nil unless DAILY_VALUE.include?(nutrient)
    (send(nutrient) / DAILY_VALUE[nutrient]).value
  end
end
