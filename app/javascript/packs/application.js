import "bootstrap";
import places from 'places.js';

if (document.querySelector('#patch_address')) {
  const placesAutocomplete = places({
    appId: process.env.ALGOLIA_APP_ID,
    apiKey: process.env.ALGOLIA_APP_KEY,
    container: document.querySelector('#patch_address')
  });
}


// import { initSweetalert } from '../plugins/init_sweetalert';

// initSweetalert('#sweet-alert-demo', {
//   title: "A nice alert",
//   text: "This is a great alert, isn't it?",
//   icon: "success"
// }, (value) => {
//   console.log(value);
// });







