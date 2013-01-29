class City < ActiveRecord::Base
  set_table_name :city
  set_primary_key :city_id

  belongs_to :country
  has_many :addresses
  has_many :stores, :through => :addresses
end