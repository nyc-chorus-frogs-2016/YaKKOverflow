$(document).ready(function(){
  $('.add-question-response').on('click', function(event){
    event.preventDefault();
    $('#question-response-form').toggle();
  });

  $('.add-answer-response').on('click', function(event){
    event.preventDefault();
   $(event.target).parent().children('div').toggle();
  });
});
