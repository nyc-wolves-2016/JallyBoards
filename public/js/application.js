$(document).ready(function() {

    $('#post-answer').submit(function(event) {
      event.preventDefault();
      var data = $(this).serialize();
      $.ajax({
        url: $(this).attr('action'),
        method: 'POST',
        data: data
      }).done(function(response){
        console.log(response)
        $('.answer-list').append(response);
        $(event.target).trigger("reset");
      });
    });

  $('.user-options').on('mouseover', '.vote-button', function(){
    console.log(this);
    $(this).closest('.question_box').find('.login-box').slideToggle();

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
  $('.answer-list').on('click', '.starrable', function(event){
    event.preventDefault();
    event.stopPropagation();
    var theButtonFormallyKnownAsRichie = $(this).parent().find('.put-form').attr("action");
    console.log(theButtonFormallyKnownAsRichie);
    $.ajax({
      url: theButtonFormallyKnownAsRichie,
      method: "PUT"
    }).done(function(response){
    $('.answer-list').find('.star-button').removeClass('starred');
    $(event.target).addClass('starred');
  });
  });
});
