$(document).ready(function(){ 

  $('#response form').on('submit', function(e) {

    e.preventDefault();
    var $self = $(this);
    var params = $self.serialize();

    $.ajax({
      type:     $self.attr('method'),
      url:      $self.attr('action'),
      dataType: 'json',
      data:     params,
      success: function(data, status, xhr) {
        $('.stat_column').html('hello')
      }
      error: function(xhr, status, error) {

      }
      complete: function(xhr, status) {

      }

    });

  });

});

