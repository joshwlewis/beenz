class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: 'User'
  belongs_to :ratee, class_name: 'User'

  validates_presence_of :rater, :ratee, :beenz
  validates_associated :rater, :ratee

  validates_uniqueness_of :ratee_id, scope: :rater_id

  validates_numericality_of :beenz, integer_only: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5
end
