require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_columns
    user = User.last
    assert_kind_of String, user.name
    assert_kind_of String, user.email
    assert_kind_of String, user.password_digest
    assert_kind_of Integer, user.beenz
  end

  def test_uniqueness_validations
    u = User.last.dup
    refute u.valid?
    %i{name email}.each do |attr|
      assert_includes u.errors[attr], "has already been taken"
    end
  end

  def test_presence_validations
    user = User.new
    refute user.valid?
    %i{name email password_digest}.each do |attr|
      assert_includes user.errors[attr], "can't be blank"
    end
  end

  def test_associations
    user = User.last
    assert_kind_of Rating, user.performed_ratings.first
    assert_kind_of Rating, user.recieved_ratings.first
    assert_kind_of User,   user.ratees.first
    assert_kind_of User,   user.raters.first
  end
end
