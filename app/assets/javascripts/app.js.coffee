$(document).ready ->
  $('.datatable').dataTable()
  $('.date_picker').datepicker(
    startView: 2,
    autoclose: true,
    format: 'dd/mm/yyyy',
    defaultViewDate: { year: 1960}
    ) 
  @showBirthdayForm = ->
    $(".student_birthdate").toggle()
    $("#birthdate_link").hide()