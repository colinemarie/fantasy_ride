import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/colinemarie/ckk80dph00glq18qlviynnrko'
  });
};

const addMarkersToMap = (map, markers) => {
  const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);
  // Create a HTML element for your custom marker
  const element = document.createElement('div');
  element.className = 'marker';
  // element.style.backgroundImage = `url('${marker.image_url}')`;
  // element.style.backgroundSize = 'contain';
  // element.style.width = '25px';
  // element.style.height = '25px';
  // Pass the element as an argument to the new marker
  new mapboxgl.Marker({
    color: "#5F2EEA"
  })
    .setLngLat([ markers.lng, markers.lat ])
    .setPopup(popup) // add this
    .addTo(map);
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ markers.lng, markers.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 5 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
