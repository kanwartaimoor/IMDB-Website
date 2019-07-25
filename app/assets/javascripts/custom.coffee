#To be fixed in later commits
$(document).ready ->
  $('.play-trailer').on 'click', ->
    toggleVideo 'show'
    $('.moviecard').addClass 'movie-view-trailer'

  $('.back-btn').click ->
    $('.moviecard').removeClass 'movie-view-trailer'
    toggleVideo 'hide'

  jQuery('#myCarousel').carousel interval: 3000

  $('#btnadd').click ->
    $('.add_actor').toggle 'slide'

  $('#search_textbox').keyup ->
    $('#search_submit').click()

  $('#btn_search_show').on 'click', ->
    if $('#search_div').css('display') == 'none'
      $('#search_div').show()
    else
      $('#search_div').hide()

  total = $('form').find 'input'
  i = 0
  html = "<i class='fa fa-asterisk' style='font-size: 7px ;color: lightcoral'></i>"
  while i < total.length
    if total[i].hasAttribute('required')
      sib = total[i].previousElementSibling
      $(sib).append ' '+html
    i++;

  toggleVideo = (state) ->
    div = document.getElementById('youvideo')
    iframe = div.getElementsByTagName('iframe')[0].contentWindow
    div.style.display = if state == 'hide' then 'none' else ''
    if state == 'hide'
      src = $('#youvideo > iframe').attr 'src'
      $('#youvideo > iframe').attr('src','')
      $('#youvideo > iframe').attr('src',src)

  $('#new_movies').animate { scrollLeft: '+=200' }, 500
return