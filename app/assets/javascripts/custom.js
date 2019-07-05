// $(document).ready(function(){
//   $(".play-trailer").on('click', function(){
//     toggleVideo('show');
//     $(".moviecard").addClass("movie-view-trailer");
//   });

//   $(".back-btn").click(function(){
//     $(".moviecard").removeClass("movie-view-trailer");
//     toggleVideo('hide');
//   }); 
// });

// function toggleVideo(state) {
//     // if state == 'hide', hide. Else: show video
//     var div = document.getElementById("youvideo");
//     var iframe = div.getElementsByTagName("iframe")[0].contentWindow;
//     div.style.display = state == 'hide' ? 'none' : '';
//     func = state == 'hide' ? 'pauseVideo' : 'playVideo';
//     iframe.postMessage('{"event":"command","func":"' + func + '","args":""}', '*');
// }

// $(document).ready(function(){
//     $('#btnadd').click(function() {
//       $('.add_actor').toggle("slide");
//     });

    // url = window.location.href
    // id = url.substring(url.lastIndexOf('/') + 1);

    // $("#actorsubmit").click(function(){
    //   $.ajax({
    //           url : id+"/addActor",
    //           type : "POST",
    //           data : { data_value: $("#actors_actor_id").val() }
    //       });
    // });
// });
