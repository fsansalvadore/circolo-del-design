// import 'mapbox-gl/dist/mapbox-gl.css';

import { cookies } from '../packs/cookies';
import { webflowJS } from '../packs/webflow';
import { Menu } from '../packs/menu';
import { Popup } from '../packs/event-popup';
import { Toggle } from '../packs/toggle';
import { SimpleParallax } from '../packs/simple-parallax';
// import { initMapbox } from '../plugins/init_mapbox';

cookies();
webflowJS();
Menu();
Popup();
Toggle();
SimpleParallax();

