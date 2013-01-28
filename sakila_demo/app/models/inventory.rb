class Inventory < ActiveRecord::Base
  belongs_to :film
  belongs_to :store

  set_table_name :inventory
  set_primary_key :inventory_id
end