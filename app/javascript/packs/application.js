import "bootstrap";

import places from 'places.js'

const placesAutocomplete = places({
  appId: process.env.ALGOLIA_APP_ID,
  apiKey: process.env.ALGOLIA_APP_KEY,
  container: document.querySelector('#patch_address')
});

