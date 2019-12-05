import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButtons = document.querySelectorAll(selector);
  swalButtons.forEach((swalButton) => {
    if (swalButton) { // protect other pages
      swalButton.addEventListener('click', () => {
        swal(options).then(callback); // <-- add the `.then(callback)`
      });
    }
  })
};

export { initSweetalert };



const initSweetalertWater = (selector, options = {}, callback = () => {}) => {
  const swalButtons = document.querySelectorAll(selector);
  swalButtons.forEach((swalButton) => {
    if (swalButton) { // protect other pages
      swalButton.addEventListener('click', () => {
        swal(options).then(callback); // <-- add the `.then(callback)`
      });
    }
  })
};

export { initSweetalertWater };


const initSweetalertHarvest = (selector, options = {}, callback = () => {}) => {
  const swalButtons = document.querySelectorAll(selector);
  swalButtons.forEach((swalButton) => {
    if (swalButton) { // protect other pages
      swalButton.addEventListener('click', () => {
        swal(options).then(callback); // <-- add the `.then(callback)`
      });
    }
  })
};

export { initSweetalertHarvest };
