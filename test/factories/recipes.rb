FactoryGirl.define do
  factory :recipe do
    name 'Fresh Orange and Yogurt Tart'
    photo       { File.open("#{Rails.root}/test/files/orange-pie.jpg") }
    description 'This sunny tart, with its Greek-yogurt filling' \
                'and almond crust, makes a crowd-pleasing brunch dish. Be ' \
                'sure to save the leftover rinds to make Candied Citrus Peel.'
    calories    { Unitwise(50, :joule)  }
    serving     { Unitwise(1000, :gram) }
    published true
  end
end
