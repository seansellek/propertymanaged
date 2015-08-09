// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var ready;
ready = function() {
    $('.properties').on('click', '.invite-tenant', displayer);
    $('#popup-form').on('click', '#invite-close', formHide);
    $('#popup-form').on('submit', formSubmit);
    setTimeout(hideError, 3000);
    setTimeout(hideNotice, 3000);
    $('#popup-form').on('input propertychange paste', '#invite_amount', currency);
    $('.back_link').click(function() {
        window.history.back();
        return false;
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);

function displayer(event) {
    event.preventDefault();
    var path = $(event.target).attr('href');

    $.ajax(path, {
        success: function(response) {
            var form = response;
            $('#popup-form').html(form).slideDown();
        }
    });
};

function formHide(event) {
    event.preventDefault;
    $('#popup-form').slideUp();
};

function formSubmit(event) {
    $('#popup-form').slideUp();
    console.log(event)
};

function hideError() {
    $('#error').css('margin-top', '-50px');
};

function hideNotice() {
    $('#notice').css('margin-top', '-50px');
}

function currency(event) {
    console.log('hello!');
    $('#invite_amount').autoNumeric('init', {
        aSign: '$'
    });
}