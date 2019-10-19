$(function() {
  $('#memo_type_all').change( function() {
    location.href='/memos?memo_type=all';
  });

  $('#memo_type_book').change( function() {
    location.href='/memos?memo_type=book';
  });

  $('#memo_type_normal').change( function() {
    location.href='/memos?memo_type=normal';
  });
});
