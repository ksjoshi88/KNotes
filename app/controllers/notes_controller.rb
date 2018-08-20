class NotesController < ApplicationController

  def index
    @notes = Note.all
    @notes_count = @notes.count
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: {message: 'Note created'}
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: {message: 'Note deleted'}
  end

  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:content)
  end

end
