$(document).ready(function() {
<<<<<<< HEAD
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

    $('.question-list').on('submit', '#ask_questions', function(event) {
      event.preventDefault();

      var data = $(this).serialize();

      console.log(data);

    });

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
