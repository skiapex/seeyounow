# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#clinician_speciality_id').parent().hide()
  specialitys = $('#clinician_speciality_id').html()
  $('#clinician_occupation_id').change ->
    occupation = $('#clinician_occupation_id :selected').text()
    escaped_occupation = occupation.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(specialitys).filter("optgroup[label='#{escaped_occupation}']").html()
    if options
      $('#clinician_speciality_id').html(options)
      $('#clinician_speciality_id').parent().show()
    else
      $('#clinician_speciality_id').empty()
      $('#clinician_speciality_id').parent().hide()