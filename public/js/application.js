$(document).ready(function() {
  $('.voteForm').on('mouseover', '.upVoteButton', function(event){
    $(this).closest('.voteForm').find('.loginBox').slideToggle();
  });
  function loginToggler(loginBox) {
    var loginText = $('.loginBox').find('input[name="email"]').val();
    if (!loginText) {
      $(loginBox).slideToggle();
    };
  };
  $('.loginBox').on('mouseleave', function(event){
    loginToggler($(event.target).closest('.loginBox'));
  });
});
