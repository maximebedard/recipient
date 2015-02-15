module ModelAssertionsHelper
  # Assert that the attribute is present when validating the record
  # Example :
  #  def MyModel < ActiveRecord::Base
  #    validate_presence_of :name
  #  end
  #
  #  a = MyModel.new
  #  assert_presence_of a, :name
  def assert_presence_of(subject, attr, expected_message = :blank)
    assert_not subject.valid?
    assert subject.errors.added? attr, expected_message
  end

  # Assert that the attribute is unique when validating the record
  # Example:
  #  def MyModel < ActiveRecord::Base
  #    validate_uniqueness_of :name
  #  end
  #
  # a = FactoryGirl.create(:ingredient)
  # assert_uniqueness_of a, :name
  def assert_uniqueness_of(subject, attr, expected_message = :taken)
    subject.save
    subject_copy = subject.dup
    assert_raise(ActiveRecord::RecordInvalid) { subject_copy.save! }
    assert subject_copy.errors.added? attr, expected_message
  end
end
