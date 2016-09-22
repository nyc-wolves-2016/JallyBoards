$(document).ready(function() {
  $('.voteForm').on('mouseover', '.up-vote-button', function(event){
    $(this).closest('.vote-form').find('.login-box').slideToggle();
  });
  function loginToggler(loginBox) {
    var loginText = $('.login-box').find('input[name="email"]').val();
    if (!loginText) {
      $(loginBox).slideToggle();
    };
  };
  $('.login-box').on('mouseleave', function(event){
    loginToggler($(event.target).closest('.login-box'));
  });
});
