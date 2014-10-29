require 'digest/md5'
class User < ActiveRecord::Base
  has_secure_password

  has_many :performed_ratings, class_name: 'Rating', foreign_key: :rater_id
  has_many :recieved_ratings,  class_name: 'Rating', foreign_key: :ratee_id

  has_many :raters, through: :recieved_ratings
  has_many :ratees, through: :performed_ratings

  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :name, :email

  validates_numericality_of :beenz, integer_only: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5

  def calculate_beenz
    total_rating = 0
    total_weight  = 0
    recieved_ratings.includes(:rater).each do |rating|
      weight = rating.rater.beenz
      rating = rating.beenz * weight
      total_weight += weight
      total_rating += rating
    end
    case (total_rating.to_f / total_weight)
    when 1..1.8
      1
    when 1.8..2.6
      2
    when 2.6..3.4
      3
    when 3.4..4.2
      4
    when 4.2..5
      5
    end
  end

  def update_beenz!
    self.update_attributes(beenz: calculate_beenz)
  end

  def email=(string)
    super(string.strip.downcase)
  end

  def gravatar_url
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end

end
