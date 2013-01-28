class Actor < ActiveRecord::Base

  has_many :film_actor
  has_many :films, :through => :film_actor
  has_many :categories, :through => :films

  set_table_name :actor
  set_primary_key :actor_id

  def self.most_films
    self
      .select("actor.*, COUNT(*) AS number_of_films")
      .joins(:films)
      .group("actor_id")
      .order("number_of_films DESC")
  end

  def self.longest_careers
    self
      .select("actor.*, (MAX(film.release_year) - MIN(film.release_year)) AS career_length")
      .joins(:films)
      .group(:actor_id)
      .order("career_length DESC")
  end

end