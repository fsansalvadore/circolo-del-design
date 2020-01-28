import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([45.065,7.687]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v8'
    });

    map.addControl(new mapboxgl.NavigationControl());

    new mapboxgl.Marker()
      .setLngLat([45.065,7.687])
      .addTo(map);

    fitMapToMarkers(map);
  }
};

export { initMapbox };
