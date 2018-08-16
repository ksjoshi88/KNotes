class NotesController < ApplicationController

  def index
    @notes = Note.all
    @notes_count = @notes.count
  end
end
