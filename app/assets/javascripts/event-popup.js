const popup = $(".event-popup-details-container");

$(window).on('scroll', function () {
    if ($(window).scrollTop() >= ($('#main-content').offset().top) - $('.navbar-inner-page').height()) {
        popup.addClass('popup-open');
    } else {
        popup.removeClass('popup-open');
    }
});
