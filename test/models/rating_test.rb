require "test_helper"

class RatingTest < ActiveSupport::TestCase

  def test_attributes
    rating = Rating.last
    %i{rater_id ratee_id beenz}.each do |attr|
      assert_kind_of Integer, rating.send(attr)
    end
  end

  def test_presence_validations
    rating = Rating.new
    refute rating.valid?
    %i{rater ratee beenz}.each do |attr|
      assert_includes rating.errors[attr], "can't be blank"
    end
  end

  def test_uniqueness_validations
    rating = Rating.last.dup
    refute rating.valid?
    assert_includes rating.errors[:ratee_id], "has already been taken"
  end

end
