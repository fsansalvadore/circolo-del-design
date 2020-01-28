import simpleParallax from 'simple-parallax-js';

const SimpleParallax = () => {
  var image = document.getElementsByClassName('contacts-prlx-img');
  new simpleParallax(image);
}

export { SimpleParallax };
