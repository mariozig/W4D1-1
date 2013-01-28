class FilmActor < ActiveRecord::Base
  belongs_to(:film)
  belongs_to(:actor)
  set_table_name(:film_actor)
end