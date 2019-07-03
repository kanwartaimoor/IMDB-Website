toggleVideo = (state) ->
  # if state == 'hide', hide. Else: show video
  div = document.getElementById('youvideo')
  iframe = div.getElementsByTagName('iframe')[0].contentWindow
  div.style.display = if state == 'hide' then 'none' else ''
  func = if state == 'hide' then 'pauseVideo' else 'playVideo'
  iframe.postMessage '{"event":"command","func":"' + func + '","args":""}', '*'
  return

$(document).ready ->
  $('.play-trailer').on 'click', ->
    toggleVideo 'show'
    $('.moviecard').addClass 'movie-view-trailer'
    return
  $('.back-btn').click ->
    $('.moviecard').removeClass 'movie-view-trailer'
    toggleVideo 'hide'
    return
  return
