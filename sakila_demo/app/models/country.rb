class Country < ActiveRecord::Base
  set_table_name :country
  set_primary_key :country_id

  has_many :cities
end