module HasNutritionFacts
  extend ActiveSupport::Concern

  included do
    # Calculating units
    unit_for :serving

    # ref : http://www.inspection.gc.ca/food/labelling/food-labelling-for-industry/nutrition-labelling/information-within-the-nutrition-facts-table/eng/1389198568400/1389198597278?chap=1
    # Nutrients
    unit_for :calories,      convert_to: 'J'
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

    # Validate compatibility of nutrients
    validates_presence_of :calories, :serving
    validates_unit_compatibility_of :fat,           with: :gram
    validates_unit_compatibility_of :saturated_fat, with: :gram
    validates_unit_compatibility_of :trans_fat,     with: :gram
    validates_unit_compatibility_of :cholesterol,   with: :milligram
    validates_unit_compatibility_of :sodium,        with: :milligram
    validates_unit_compatibility_of :carbohydrate,  with: :gram
    validates_unit_compatibility_of :fibre,         with: :gram
    validates_unit_compatibility_of :sugar,         with: :gram
    validates_unit_compatibility_of :protein,       with: :gram
    validates_unit_compatibility_of :vitamin_a,     with: 'IU'
    validates_unit_compatibility_of :vitamin_c,     with: :milligram
    validates_unit_compatibility_of :calcium,       with: :milligram
    validates_unit_compatibility_of :iron,          with: :milligram
  end

  # Daily value constants based n a 2000 calories diet.
  # http://www.fda.gov/food/guidanceregulation/guidancedocumentsregulatoryinformation/labelingnutrition/ucm064928.htm
  DAILY_VALUE = {
    fat:                      Unitwise(65,   :gram),
    saturated_and_trans_fats: Unitwise(20,   :gram),
    cholesterol:              Unitwise(300,  :milligram),
    sodium:                   Unitwise(2400, :milligram),
    carbohydrate:             Unitwise(300,  :gram),
    fibre:                    Unitwise(25,   :gram),
    vitamin_a:                Unitwise(5000, :international_unit),
    vitamin_c:                Unitwise(60,   :milligram),
    calcium:                  Unitwise(1100, :milligram),
    iron:                     Unitwise(14,   :milligram)
  }

  # Return the saturated and trans fat +measurement+
  def saturated_and_trans_fats
    saturated_fat + trans_fat
  end

  # Return the daily value of the nutrient symbol.
  def daily_value_of(nutrient)
    return nil unless DAILY_VALUE.include?(nutrient)
    (send(nutrient) / DAILY_VALUE[nutrient]).value
  end
end
