class Film < ActiveRecord::Base
  has_many :film_actor
  has_one :film_category
  has_many :actors, :through => :film_actor
  has_one :category, :through => :film_category

  set_table_name(:film)
  set_primary_key(:film_id)

end