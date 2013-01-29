class Film < ActiveRecord::Base
  has_many :film_actor
  has_many :actors, :through => :film_actor
  has_one :film_category
  has_one :category, :through => :film_category
  has_many :inventories
  has_many :stores, :through => :inventories
  has_many :rentals, :through => :inventories

  set_table_name :film
  set_primary_key :film_id

  def self.most_actors
    self
      .select("film.*, COUNT(*) AS number_of_actors")
      .joins(:actors)
      .group("film_id")
      .order("number_of_actors DESC")
  end

  def self.most_stores
    self
      .select("film.*, COUNT(DISTINCT store.store_id) AS number_of_stores")
      .joins(:stores)
      .group("film_id")
      .order("number_of_stores DESC")
  end

  def self.most_inventory
    self
      .select("film.*, COUNT(DISTINCT inventory_id) AS number_of_inventories")
      .joins(:inventories)
      .group("film_id")
      .order("number_of_inventories DESC")
  end

  def self.most_watched
    self
      .select("film.title, COUNT(rental_id) AS number_of_views")
      .joins(:rentals)
      .group("film.film_id")
      .order("number_of_views DESC")
  end
end


