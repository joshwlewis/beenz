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

end
