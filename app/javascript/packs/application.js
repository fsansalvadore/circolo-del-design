// import 'mapbox-gl/dist/mapbox-gl.css';
import { cookies } from '../packs/cookies';
import { webflowJS } from '../packs/webflow';
import { Menu } from '../packs/menu';
import { Popup } from '../packs/event-popup';
import { ImgParallax } from '../packs/img-parallax';
import { Map } from '../packs/map';
// import { initMapbox } from '../plugins/init_mapbox';

cookies();
webflowJS();
Menu();
Popup();
ImgParallax();
// Map();
// initMapbox();

