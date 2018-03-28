$(function() {

   $("#add-new-group").hide();
    $('#add-group-btn').click(function () {
      $("#add-new-group").slideToggle(function() {
        $('#new_group').focus();
      });
      return false;
    });


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
            $.notify({
              title: "New Group Added:",
              message: '<p class="text-success pt-2 mb-0">The Group: ' + '"' + group.name+'"' + ' was successfuly created you can now select it</p>'
            });
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


