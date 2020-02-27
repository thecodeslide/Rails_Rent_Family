import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.getElementById('user_address');
  if (locationInput) {
    places({ container: locationInput });
  }
};
