require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  test "should be able to get notes" do
    create_notes()
    get notes_url()
    assert_equal assigns(:notes).count, 3
  end

  test "should be able to display notes" do
    create_notes()
    get notes_url()
    assert_select '.note-container',3
  end

  test "should display the message if no notes are available" do
    Note.destroy_all
    get notes_url()
    assert_equal assigns(:notes).count, 0
    assert_select '.notes-unavailable-container', 1
  end

  private

  def create_notes
    3.times do
      create(:note)
    end
  end

end
