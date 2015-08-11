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
    prepareDropzone();
    prepareMasonry();
    prepareHelloSign();

    $('.properties').on('click', '.invite-tenant', displayer);
    $('#add_property').on('click', displayer)
    $('#popup-form').on('click', '#form-close', formHide);
    $('#popup-form').on('submit', formSubmit);
    setTimeout(hideError, 3000);
    setTimeout(hideNotice, 3000);
    $('#popup-form').on('input propertychange paste', '#invite_amount', currency);
    $('#ticket_comment').on('click', displayer)
    $('.click_row').on('click', rowClick);


};

$(document).ready(ready);
$(document).on('page:load', ready);

function displayCommentForm(event) {
    event.preventDefault();
    var path = $(event.target).attr('href');
    $.ajax(path, {
        success: function(response) {
            var form = response;
            $('#new_comment').html(form).addClass('new_comment_form').slideUp;
        }
    })
}

function displayer(event) {
    event.preventDefault();
    var path = $(event.target).attr('href');
    console.log(path);
    $.ajax(path, {
        success: function(response) {
            var form = response;
            console.log(form);
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

function rowClick(event) {
    var href = $(this).find('a').attr('href');
    if (href) {
        window.location = href;
    }
}

function prepareDropzone() {
    Dropzone.autoDiscover = false;

    $('.dropzone').dropzone({
        paramName: 'picture[image]',
        init: function() {
            this.on('success', addImageToTicketForm);
        }
    });

    function addImageToTicketForm(event, response) {
        var field = ""
        $('<input>').attr({
            type: 'hidden',
            name: 'picture_ids[]',
            value: response['picture_id']
        }).prependTo('#new_ticket');
    }
}

function prepareMasonry() {
    var grid = $('#masonry_images').masonry({
        itemSelector: '.masonry_image',
        columnWidth: '50%'
    });
}

function prepareHelloSign() {
    var sign_url = $('#hello_sign_request').html();
    if (sign_url) {
        embeddedSignatureRequest(sign_url);
    }
}

function embeddedSignatureRequest(url) {
    HelloSign.init("a5a0c7391936852c61f3eaa29a25081e");
    HelloSign.open({
        'skipDomainVerification': true,
        'url': url,
        'allowCancel': true,
        'messageListener': function(eventData) {
            var url = $('#contract_id').html();
            $.ajax(url, {
                data: {
                    signature_id: eventData['signature_id']
                },
                success: function(response) {
                    console.log(response);
                }
            });
        }
    });
}
