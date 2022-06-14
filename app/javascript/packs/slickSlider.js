const SlickSlider = () => {
  // Slick slider
  var customSlickSlider = function () {
    // Featured slider 1
    $(".slick-carousel").slick({
      dots: false,
      infinite: true,
      speed: 500,
      arrows: true,
      slidesToShow: 1,
      autoplay: false,
      loop: true,
      adaptiveHeight: true,
      fade: true,
      cssEase: "linear",
      prevArrow:
        '<button type="button" class="slick-prev"><i class="flaticon-left"></i></button>',
      nextArrow:
        '<button type="button" class="slick-next"><i class="flaticon-right"></i></button>',
      appendArrows: ".arrow-cover",
    });
  };
};

export { SlickSlider };
