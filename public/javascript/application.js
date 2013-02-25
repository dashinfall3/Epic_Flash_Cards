$(document).ready(function(){ 

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

});


$(document).ready(function(){
  $('.input-answer').submit(function(e) {
    e.preventDefault();

    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",
      success: function(data,status,xhr){
        if (data.current_card === null)
          {
            $.get("/games/"+ data.guess.guess.game_id + "/result")     
          }
        else
          {
            // $('#question').html(data.current_card.card.question);
            // $('.stat_column h3').html("Progress: " + data.current_card)
            // $('.card_id').val(data.current_card.card.id);
            // We don't know what to do
          }
      }
    });
  });
});


// $.get("/games/" + data.guess.guess.game_id + "/result")

  

