$(document).ready(function(){ 
  $('#guess_form').submit(function(e) {
    e.preventDefault()
    var userInput = $('#guess_form').serialize();
    var gameID = $('#guess_form').find('#game_id').attr("value");

    $.post('/games/' + gameID + '/guesses', userInput, function(guess){
      if (guess['results'] == null) {
        $('#question').html(guess['current_card']['card']['question']);
        $('#answer').html(guess['card']['card']['answer']);
        var current_card = guess['game']['game']['current_card'] + 1
        $('#current_card_count').html(current_card);
        $('#percent_correct').html(guess['percent_correct']);
      } else {
        $('#time_notification').html(guess['time_notification']);
        $('#correct_count').html(guess['correct_count']);
        $('#percent_correct_result').html(guess['percent_correct']);
        $('#card_content').hide();
        debugger
      }
      // $('#price').html(post['post'].price);
      // $('#contact').html(post['post'].contact_name);
      // $('#email').html(post['post'].email);

    });
  });

  $('.add_new_card').submit(function(e){
    e.preventDefault();

    $.ajax({ //What JQuery object are we selecting here?  Are you calling on jQuery class?
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",
      success: function(data, status, xhr){
        var message = 'New card created!';
        $('h2').html(message);
        var newCard = "<li>Question: " + data.question + "</li><li>Answer: "+ data.answer + "</li><br>";
        $("ul.card-list li:first").hide().prepend(newCard).slideDown();
        $('.add_new_card textarea').val('');
      }
    });
  });



  $('.game_column:even').css('background-color', '#cccccc')
});


