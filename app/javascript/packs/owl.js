const Owl = () => {

$(document).ready(function(){
  $(".owl-carousel").owlCarousel({
    items:4,
    lazyLoad:true,
    loop:true,
    margin:10,
    responsive: true,
  });
});
}

export { Owl };
