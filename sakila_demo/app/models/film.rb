class Film < ActiveRecord::Base
  has_many :film_actor
  has_many :actors, :through => :film_actor

  set_table_name(:film)
  set_primary_key(:film_id)

end