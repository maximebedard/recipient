class Ingredient < ActiveRecord::Base


  def self.unit_attr(*attribute_names)

    attribute_names.each do |prop|
      define_method(prop) do
        Unitwise(send("#{prop}_value"), send("#{prop}_unit"))
      end

      define_method("#{prop}=") do |val|
        send "#{prop}_value=", val.value
        send "#{prop}_unit=", val.unit.to_s
      end
    end
    
  end

  unit_attr :serving, :calories, :carbohydrates, :fat, :proteins

end
