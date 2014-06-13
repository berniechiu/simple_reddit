// Set up preview.
$('#link_url').preview({key: "9ec348250791474292517180061d12ce"})
  .on('loading', function(){
    $(this).prop('disabled', true);
  }).on('loaded', function(){
    $(this).prop('disabled', false);
    $('input#link-submit').val('Share Link');
  });
