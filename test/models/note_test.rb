require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should be invalid without content" do
      note = build(:note, content: nil)
      assert_not note.valid?
  end

  test "should be valid with valid content" do
    note = build(:note)
    assert note.valid?
  end
end
