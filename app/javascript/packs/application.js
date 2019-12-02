import "bootstrap";

import places from 'places.js';

if (document.querySelector('#patch_address')) {
  const placesAutocomplete = places({
    appId: process.env.ALGOLIA_APP_ID,
    apiKey: process.env.ALGOLIA_APP_KEY,
    container: document.querySelector('#patch_address')
  });
}


// ---- AJAX ----- //

// const button = document.querySelector("#plus-button");

// button.addEventListener('click', (event) => {
//   event.preventDefault();
// })

// const results = document.querySelector("#veg-results")
// const url = "http://localhost:3000/patches/10/plant"
// // need to interpolate url???
//   .then(response => response.json())
//   .then((data) => {
//     // console.log(data);
//     // not returning an array -> "unexpected token < in JSON at position 0"
//     data.Search.forEach((vegetable) => {
//       const newVegetable = `<li>
//       "<p><%= ${plant.name.capitalize} %>" <%= link_to "-", patch_plant_path(PatchPlant.where(plant: plant, patch: @patch).first), method: :delete %> </p>
//       </li>`
//       results.insertAdjacentHTML('beforeend', newVegetable)
//     });
// });




// const addVegToPatch = (event) => {
//   fetch (url, {
//     method: "POST",
//     body: JSON.stringify({ query event.currentTarget.value })
//   })
//   .then
// }
