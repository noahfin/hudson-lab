$(function() {
    $('.edit_task input[type=checkbox]').click(function() {
        alert('clicked');
    });
});
$(function() {
    $('.edit_task input[type=submit]').remove();
    $('.edit_task input[type=checkbox]').click(function() {
        $(this).parent('form').submit();
    });
});

jQuery.fn.submitOnCheck = function() {
    this.find('input[type=submit]').remove();
    this.find('input[type=checkbox]').click(function() {
        $(this).parent('form').submit();
    });
    return this;
}

$(function() {
    $('.edit_task').submitOnCheck();
});
