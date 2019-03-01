# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).on 'load', ->
  count_like = parseInt($('#count-like label').text())
  count_dislike = parseInt($('#count-dislike label').text())
  width_like = (count_like/(count_like + count_dislike)) * 100
  width_dislike = (count_dislike/(count_dislike + count_like)) * 100
  $('#progress_like').css('width', width_like + '%');
  $('#progress_dislike').css('width', width_dislike + '%');

#submitedForm = ->
#    $('#submitForm').trigger()
#  console.log('hello')
#  $('#star5').on('click', ->
#    $('#submitForm').trigger()
#  )

#submitedForm = ->
#  radio = document.querySelectorAll('input[type=radio]')
#  for r in radio
#    if t.checked
#      alert(r.value)