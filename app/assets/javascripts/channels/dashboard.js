   $(function() {


   var hrefTempIndex = "task-table-prop-1"
   $(hrefTempIndex).show();
   $(document).on('click', '.task-user-tab', function (e) {
      e.preventDefault()
      var tabSection =  $(this).attr('href');
      $(hrefTempIndex).hide();
       $(tabSection).show();
        hrefTempIndex = tabSection;
   })
   $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      e.target // newly activated tab
      e.relatedTarget // previous active tab
   });

});
