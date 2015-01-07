class Starred < ActiveRecord::Base
  belongs_to :starrable, polymorphic: true
end
