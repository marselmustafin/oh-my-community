function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#img_prev')
        .attr('src', e.target.result)
        .class("media-object rounded-circle")
    };

    reader.readAsDataURL(input.files[0]);
  }
}
