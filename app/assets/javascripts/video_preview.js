// Set up preview.
$('#video_link').preview({key: "<%= Setting.embedly_api_key %>"})
  .on('loading', function(){
    $(this).prop('disabled', true);
  }).on('loaded', function(){
    $(this).prop('disabled', false);
    $('input#link-submit').val('Share Video');
  });
