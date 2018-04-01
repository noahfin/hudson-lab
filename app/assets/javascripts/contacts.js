$(document).on('turbolinks:load', function(){
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
