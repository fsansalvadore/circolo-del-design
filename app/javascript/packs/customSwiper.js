import Swiper, { Navigation, Pagination } from "swiper";

Swiper.use([Navigation, Pagination]);

const CustomSwiper = () => {
  const _ = new Swiper(".swiper-carousel", {
    // slidesPerView: 1.4,
    slidesPerView: "auto",
    loop: false,
    spaceBetween: 15,
    // centeredSlides: true,
    grabCursor: true,
    keyboard: {
      enabled: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    pagination: {
      el: ".swiper-pagination",
    },
  });
};

export { CustomSwiper };
