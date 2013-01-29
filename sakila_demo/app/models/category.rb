class Category < ActiveRecord::Base
  has_many :film_categories
  has_many :films, :through => :film_categories
  has_many :actors, :through => :films

  has_many :rentals, :through => :films
  set_table_name :category

  def self.most_popular
    self
        .select("category.*, COUNT(*) AS number_of_films")
        .joins(:films)
        .group("category.name")
        .order("number_of_films DESC")
  end

  def self.most_rented
    self
      .select("category.name, COUNT(rental_id) AS number_of_rentals")
      .joins(:rentals)
      .group("category.name")
      .order("number_of_rentals DESC")
  end
end