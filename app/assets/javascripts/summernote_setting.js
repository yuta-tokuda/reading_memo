$(function() {
  $('.summernote').summernote({
    height: 200,
    minHeight: 200,
    lang: 'ja-JP', /*日本語対応*/
    toolbar: [
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['color', ['color']],
      ['insert', ['link']],
      ['misc', ['codeview']]
    ],
  });
});
