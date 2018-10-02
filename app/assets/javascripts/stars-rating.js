$(document).ready(function () {
  $('#rating').raty({
    path: "/assets",
    readOnly: function () {
      return $(this).attr("data-score") != 0;
    },
    score: function () {
      return $(this).attr("data-score");
    },
    click: function (score, event) {
      $.ajax({
        url: "/posts/" + $(this).attr("data-post-id") + "/ratings",
        method: "POST",
        data: {
          rating: {
            value: score
          }
        },
        dataType: "json",
        success: function () {
          $('#rating').raty("readOnly", true);
          $('#rating-status').text("Your rating successfully submitted!")
        },
        error: function () {
          $('#rating-status').text("Something went wrong!")
        }
      })
    }
  });
});
