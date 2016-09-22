$(document).ready(function() {
  $('.voteForm').on('mouseover', '.upVoteButton', function(event){
    $(this).closest('.voteForm').find('.loginBox').slideToggle();
  });
  function loginToggler {
    var loginText = $('.loginBox').find('input[name="email"]').val();
    if (!loginText) {
      $(this).slideToggle();
    };
  };
  $('.loginBox').on('mouseleave', loginToggler {
    // var loginText = $('.loginBox').find('input[name="email"]').val();
    // if (!loginText) {
    // $(this).slideToggle();
  };
  });
});
