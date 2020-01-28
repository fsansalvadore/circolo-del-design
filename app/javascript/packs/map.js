const Map = () => {
  // Initialize and add the map
  function initMap() {
  // The location of Uluru
  var circolo = {lat: 45.065, lng: 7.687};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: circolo});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: circolo, map: map});
  }
};

export { Map };
