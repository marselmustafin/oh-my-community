$(document).ready(function () {
  var input = $("#user-search-input")

  var options = {
    getValue: "match",
    url: function (keywords) {
      return "users_autocompletions?keywords=" + keywords
    }
  }

  input.easyAutocomplete(options)
});

$(document).ready(function () {
  var input = $("#post-search-input")

  var options = {
    getValue: "match",
    url: function (keywords) {
      return "posts_autocompletions?keywords=" + keywords
    }
  }

  input.easyAutocomplete(options)
});
