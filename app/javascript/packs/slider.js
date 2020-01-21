const slider = () => {

const slider = document.querySelector('.carousel-slider-a');
let slideIndex = 0;
const navDots = document.querySelectorAll('.carousel-a-nav-dot');

navDots.forEach(function(dot, ind) {
  dot.addEventListener('click', function() {
    slideIndex = ind;
    document.querySelector('.carousel-a-nav-dot.selected').classList.remove('selected');
    dot.classList.add('selected');
    slider.style.transform = 'translateX(' + (slideIndex) * -(100/(navDots.length)) + '%)';
  });
});
}

export { slider };
