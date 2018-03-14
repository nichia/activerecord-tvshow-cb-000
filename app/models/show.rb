class Show < ActiveRecord::Base
  # return the highest value in the ratings column
  def self.highest_rating
    Show.maximum(:rating)
  end

  # return the show with the highest rating
  def self.most_popular_show
    Show.where("rating = #{self.highest_rating}").take
  end

  # returns the lowest value in the ratings column
  def self.lowest_rating
    #Show.minimum(:rating)
    Show.order(rating: :asc).first.rating
  end

  # returns the show with the lowest rating
  def self.least_popular_show
    #Show.where("rating = #{self.lowest_rating}").take
    Show.order(rating: :asc).first
  end

  # returns the sum of all of the ratings
  def self.ratings_sum
    Show.sum(:rating)
  end

  #  returns an array of all of the shows that have a rating greater than 5
  def self.popular_shows
    Show.where("rating > ?", 5)
  end

  #  returns an array of all of the shows sorted by alphabetical order according to their names
  def self.shows_by_alphabetical_order
    Show.order(name: :asc)
  end
end
