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


