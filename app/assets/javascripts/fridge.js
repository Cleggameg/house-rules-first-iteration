$(document).ready(function() {

  $("#new_message").on("ajax:success", function(e, data, status, xhr) {
  console.log("&&&&&&&&&&&&&&&&&&&&&&&")
  $("#fridge").append(xhr.responseText);
  $("#new-content").val("")
  $("#message_picture_picture_content").val("")
  return console.log("stuff", xhr.responseText);
}).on("ajax:error", function(e, xhr, status, error) {
  console.log("Failure!!")
  return $("#new_event").prepend("<p>ERROR</p>");
});
});










// $(document).on("click", "#submit-message", function(post){
//     post.preventDefault();

//     var url = window.location.pathname;
//     var route = url.substring(url.lastIndexOf('/') - 1);
//     var id = route.lastIndexOf('/');

//     createMessage = $.ajax({
//       url: "/houses/" + id + "/messages",
//       method: "POST",
//       data: $("#new-content").serialize()
//     });

//     createMes sage.done(function(response) {
//       $("#new-content").val("").end();
//       console.log(response);
//       $("#fridge").append(response);

//       //   var firstTweet = $("#tweets-container ul li:first")
//       //   var animateTweet = function() {
//       //     firstTweet.css("display", "none");
//       //     firstTweet.slideDown()
//       //   };

//       // animateTweet();
//     });
//   });