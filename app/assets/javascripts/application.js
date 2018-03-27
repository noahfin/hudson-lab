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
//= require vendorapps
//= require jasny-bootstrap.min
//= require jquery-ui/

//= require rails-ujs
//= require contacts
//= require turbolinks
//= require_tree .


// safsa//= require jquery-ui/widget
// cs= require jquery-ui/position
// cc= require jquery-ui/widgets/autocomplete
// cc= require jquery-ui/widgets/menu
//csc= require jquery-ui/core


$(function() {


   $("#save-new-group").on( "click", function(event) {
        var newGroup = $('#new_group');
        // var inputGroup = $('#new_group')

      event.preventDefault();
      $.ajax({
        url: "/groups",
        method: "post",
        data: {
          group: {name: $("#new_group").val()}
        },
        success: function (group) {
          console.log(group);
          if(group.id != null){
           newGroup.next('.text-danger').detach();
            $('#new_group').addClass('has-success')
            .after('<p class="text-success pt-2 mb-0">The Group: ' + '"' + group.name+'"' + ' was successfuly created you can now select it</p>' );

            $('#contact_group_id').append(newOption);
          }
        },
        error: function(err){

          var errors = err.responseJSON;
          var error = errors.join(", ");

          if (error) {
           newGroup.next('.text-danger').detach();
            $('#new_group').addClass('has-error')
            .after('<p class="text-danger pt-2 mb-0">' + error + '</p>' );
            }
        }
      })

    });
});



