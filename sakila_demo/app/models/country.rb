class Country < ActiveRecord::Base
  set_table_name :country
  set_primary_key :country_id

  has_many :cities
  has_many :addresses, :through => :cities
  has_many :stores, :through => :addresses

  def most_popular_actor
    rentals = self.stores.all.rentals
      .select("actor.*, COUNT(rental_id) AS num_of_rentals")
      .join(:rentals)
      .group(:actor_id)
      .order("num_of_rentals DESC")
  end
end