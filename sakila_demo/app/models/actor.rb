class Actor < ActiveRecord::Base

  has_many :film_actor
  has_many :films, :through => :film_actor

  set_table_name(:actor)
  set_primary_key(:actor_id)

end