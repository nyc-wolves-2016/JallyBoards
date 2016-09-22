$(document).ready(function() {
    $('#post-answer').on('submit', function(event) {

      event.preventDefault();

      var data = $(this).serialize();

      $.ajax({
        url: $(this).attr('action'),
        method: 'POST',
        data: data
      }).done(function(response){
        console.log(response)
        $('.answer-list').append(response);
        // $(event.target).trigger('reset');
      });
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
