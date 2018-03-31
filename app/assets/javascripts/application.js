// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require popper
//= require jquery_ujs

//= require jasny-bootstrap.min
//= require jquery-ui/widget
//= require jquery-ui/position
//= require jquery-ui/widgets/autocomplete
//= require jquery-ui/widgets/menu
//= require jquery-ui/core
//= require vendorapps

//= require rails-ujs

//= require turbolinks
//= require contacts



$(document).on('turbolinks:load', function(){
   $("#add-new-group").hide();
    $('#add-group-btn').click(function () {
      $("#add-new-group").slideToggle(function() {
        $('#new_group').focus();
      });
      return false;
    });



   $("#save-new-group").on( "click", function(event) {
    console.log('save-new-group clicked')
        var newGroup = $('#new_group');
        // var inputGroup = $('#new_group')
        console.log( $("#contact_user_id").val())

      event.preventDefault();
      $.ajax({
        url: "/groups",
        method: "post",
        data: {
          group: {name: $("#new_group").val(), users: $("#contact_user_id").val() }
        },
        success: function (group) {
          console.log(group);
          if(group.id != null){
           var newOption = '<option selected="true" value="' + group.id.toString() +'">' +group.name+'</option></select>'
           newGroup.next('.text-danger').detach();
            $('#new_group').addClass('has-success')


            $.notify({
              title: "New Group Added:",
              message: 'The Group: ' + '"' + group.name+'"' + ' was successfuly created it is selected'
            });
            $('#contact_group_id').append(newOption);
            newGroup.val("");
          }
        },
        error: function(err){

          var errors = err.responseJSON;
          var error = errors.join(", ");

          if (error) {
           newGroup.next('.text-danger').detach();
            $('#new_group').addClass('has-error')
            .after('<p class="text-danger pt-2 mb-0">' + error + '</p>' );
            $.notify({
              title: '<strong>Heads up!</strong>',
              message: error
            },{
              type: 'danger'
            });
            }
        }
      })

    });
});




$(document).on('turbolinks:load', function(){
$(document).on('click', '.navbar-toggler', function() {
    $toggle = $(this);

    if (mobile_menu_visible == 1) {
        $('html').removeClass('nav-open');

        $('.close-layer').remove();
        setTimeout(function() {
            $toggle.removeClass('toggled');
        }, 400);

        mobile_menu_visible = 0;
    } else {
        setTimeout(function() {
            $toggle.addClass('toggled');
        }, 430);

        var $layer = $('<div class="close-layer"></div>');

        if ($('body').find('.main-panel').length != 0) {
            $layer.appendTo(".main-panel");

        } else if (($('body').hasClass('off-canvas-sidebar'))) {
            $layer.appendTo(".wrapper-full-page");
        }

        setTimeout(function() {
            $layer.addClass('visible');
        }, 100);

        $layer.click(function() {
            $('html').removeClass('nav-open');
            mobile_menu_visible = 0;

            $layer.removeClass('visible');

            setTimeout(function() {
                $layer.remove();
                $toggle.removeClass('toggled');

            }, 400);
        });

        $('html').addClass('nav-open');
        mobile_menu_visible = 1;

    }

});
});
