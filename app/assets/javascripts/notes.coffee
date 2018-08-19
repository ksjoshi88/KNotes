# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class KNOTES.NotesManager
  constructor: (@container) ->
    @init()

  init: ->
    @bindEvents()

  bindEvents: ->
    @container.find('.create-note-button').click (event) =>
      @startNewNote()
    @container.find('#post-new-note').click (event) =>
      @postNewNote()
    @container.find('#cancel-new-note').click (event) =>
      @cancelNewNote()


  startNewNote: () ->
     @container.find('.new-note-container').show(500)
     @container.find('.create-note-button').prop("disabled", true)

  cancelNewNote:() ->
     @container.find('.new-note-container').hide(500)
     @container.find('.create-note-button').prop("disabled", false)

  postNewNote:() ->
     content = @container.find("#new-note-text").val()
     unless content == ""
       $.ajax
         type: "POST"
         url: '/notes'
         data: {note: {content: content}}
         success: (data) =>
           @cancelNewNote()
         error: (data) =>
           alert(data)
     return


  getProjectStatus:(projectId, projectTitle) =>
    unless projectId == ""
      $.ajax
        type: "GET"
        url: '/get_project_status/' + projectId
        success: (data) =>
          @drawChart(data, 'Project Status - ' + projectTitle)
        error: (data) =>
          alert(data)
    return

