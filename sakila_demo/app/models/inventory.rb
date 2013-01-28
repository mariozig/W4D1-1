class Inventory < ActiveRecord::Base
  belongs_to :film
  belongs_to :store
  has_many :rentals

  set_table_name :inventory
  set_primary_key :inventory_id
end