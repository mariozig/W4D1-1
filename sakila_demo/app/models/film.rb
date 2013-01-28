class Film < ActiveRecord::Base
  has_many :film_actor
  has_many :actors, :through => :film_actor
  has_one :film_category
  has_one :category, :through => :film_category

  set_table_name(:film)
  set_primary_key(:film_id)

  def self.most_actors
    self
      .select("film.*, COUNT(*) AS number_of_actors")
      .joins(:actors)
      .group("film_id")
      .order("number_of_actors DESC")
  end
end