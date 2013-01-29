class Customer < ActiveRecord::Base
  set_table_name :customer
  set_primary_key :customer_id

  # has_many :rentals
  # has_many :films, :through => :rentals, :source => :inventory
  has_many :rentals
  has_many :inventories, :through => :rentals
  has_many :films, :through => :inventories


  # Check against solutions for more optimal query
  def self.watched_most
    self
      .select("customer.*, COUNT(DISTINCT inventory.film_id) AS films_watched")
      .joins(:rentals)
      .joins(:inventories)
      .group(:customer_id)
      .order("films_watched DESC")
  end

  def films_per_cat
    counts = Hash.new(0)
    films = self.films.includes(:category).all
    films.each { |film| counts[film.category.name] +=1 }
    counts.sort_by { |k,v| v }.reverse
    counts.each do |k, v|
      puts "#{k} : #{v}"
    end
  end
end