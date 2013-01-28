class Store < ActiveRecord::Base
  has_many :inventories
  has_many :films, :through => :inventories
  
  set_table_name(:store)
end