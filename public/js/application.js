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


//   $('.new-vote-form').on('click', 'button', function(event) {
//     event.preventDefault();
//     // debugger;
//     var thisForm = this;
//     var vote = $(this).val();
//     var path = $(this).parent().attr('action');
//     // debugger;
//     $.ajax({
//       method: 'POST',
//       url: path,
//       data: {status: vote}
//     }).done(function(response) {
//       // debugger;
//       $(thisForm).parents('.user-options').children('.vote-count').remove();
//       $(thisForm).parents('.user-options').after(response);
//       $(thisForm).remove();


//     });
//   });

//   $('.change-vote-form').on('click', 'button', function(event) {
//     event.preventDefault();
//     // debugger;
//     var thisForm = this;
//     // debugger;
//     var upvote = '<button class="fa fa-thumbs-o-up up-vote-button vote-button" name="status" value="upvote" type="submit"></button>';
//     var downvote = '<button class="fa fa-thumbs-o-down down-vote-button vote-button" name="status" value="downvote" type="submit"></button>';
//     otherForm = ''
//     if (thisForm == upvote) {
//       otherForm = downvote
//     }
//     else {
//       otherForm = upvote
//     };
//     var vote = $(this).val();
//     var path = $(this).parent().attr('action');
//     debugger;
//     $.ajax({
//       method: 'PUT',
//       url: path,
//       data: {status: vote}
//     }).done(function(response) {
//       // debugger;
//       $(thisForm).parents('.user-options').children('.vote-count').remove();
//       $(thisForm).parents('.user-options').after(response);
//       $(thisForm).parents('.user-options').append(otherForm);
//       $(thisForm).remove();

//     });
//   });

});
