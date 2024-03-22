const Popup = () => {
  const popup = $(".event-popup-details-container");

  if (popup.length > 0) {
    $(window).on("scroll", function () {
      if (
        $(window).scrollTop() >=
        $("#main-content").offset().top - $(".navbar-inner-page").height()
      ) {
        popup.addClass("popup-open");
      } else {
        popup.removeClass("popup-open");
      }
    });
  } else {
    return false;
  }
};

export { Popup };
