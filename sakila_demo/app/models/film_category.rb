class FilmCategory < ActiveRecord::Base

  belongs_to :film
  belongs_to :category
  set_table_name :film_category

end