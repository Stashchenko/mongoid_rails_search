//= require jquery_ujs
//= require jquery-ui


$(document).on("page:load ready", function () {
    $("input.datepicker").datepicker({
        dateFormat: 'yy-mm-dd'
    });
});