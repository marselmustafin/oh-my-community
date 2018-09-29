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
        success: $(this).raty("readOnly", true)
      })
    }
  });
});
