const ImgParallax = () => {
  const contactImg = document.querySelector('.contacts-img');

  window.addEventListener("scroll", (e) => {
    let scro = window.scrollY;
    contactImg.style.backgroundPosition = "50% " + (0.2*scro - 150) + "px";
  });
};

export { ImgParallax };
