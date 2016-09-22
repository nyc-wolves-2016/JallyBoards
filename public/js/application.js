$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

    $('.question-list').on('submit', '#ask_questions', function(event) {
      event.preventDefault();

      var data = $(this).serialize();

      console.log(data);

    });
});
