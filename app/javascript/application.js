// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function() {
    $('.form-check-input').on('click', function() {
      var toggle_url = $(this).data('toggle_url');
      var public_status = $(this).is(':checked');
      $.ajax({
        url: toggle_url,
        type: 'PUT',
        data: {public: public_status},
        success: function(result) {
          console.log(result);
        }
      });
    });
  });
  