import "bootstrap";
import places from 'places.js';
import { initSweetalert } from '../plugins/init_sweetalert';
import { initSweetalertWater } from '../plugins/init_sweetalert';
import { initSweetalertHarvest } from '../plugins/init_sweetalert';

if (document.querySelector('#patch_address')) {
  const placesAutocomplete = places({
    appId: process.env.ALGOLIA_APP_ID,
    apiKey: process.env.ALGOLIA_APP_KEY,
    container: document.querySelector('#patch_address')
  });
}


initSweetalert('#sweet-alert-sow', {
  title: "Nice One!",
  text: "You've sowed your seeds, we'll remind you when to water them and when they're ready to harvest!",
  icon: "success"
}, (value) => {
  document.getElementById('sow-button-hidden').click();
});

initSweetalertWater('#sweet-alert-water', {
  title: "Nice One!",
  text: "Well done - you have watered your plants. We'll track the weather for you and remind you if you need to water them again!",
  icon: "success"
}, (value) => {
  console.log(value);
  document.getElementById('water-button-hidden').click();
});

initSweetalertWater('#sweet-alert-harvest', {
  title: "Nice One!",
  text: "Well done - you have watered your plants. We'll track the weather for you and remind you if you need to water them again!",
  icon: "success"
}, (value) => {
  console.log(value);
  document.getElementById('harvest-button-hidden').click();
});




