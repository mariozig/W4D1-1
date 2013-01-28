class Category < ActiveRecord::Base
  has_many :film_categories
  has_many :films, :through => :film_categories

  set_table_name(:category)
end