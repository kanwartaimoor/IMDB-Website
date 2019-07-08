#To be fixed in later commits
toggleVideo = (state) ->
  div = document.getElementById('youvideo')
  iframe = div.getElementsByTagName('iframe')[0].contentWindow
  div.style.display = if state == 'hide' then 'none' else ''
  if state == 'hide' then jQuery('.youvideo').get(0).stopVideo() 

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
  
  url = window.location.href
  id = url.substring(url.lastIndexOf('/') + 1)
  token = $('meta[name="csrf-token"]').attr('content')
  $('#actorsubmit').click ->
    $.ajax
      type: 'POST'
      url: id + '/' + $('#actors_actor_id').val() + '/addActor'
      headers: 'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').content
      success: (result) ->
        window.location.reload()
        return

  results = url.split('/');
  result = results[results.length-2];
  $('.imgremove').click ->
    $.ajax
      type: 'GET'
      url: '/movies/'+ result + '/deleteImage/' + $(this).text()
      headers: 'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').content
      success: (result) ->
        window.location.reload()
        return
  

