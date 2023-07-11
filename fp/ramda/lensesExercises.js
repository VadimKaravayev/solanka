const R = require("ramda");

const favoriteFlavor = R.lensPath([
  "interests",
  "foods",
  "sweets",
  "iceCream",
  "favoriteFlavor",
]);

/*
Capitalizes all the flavors
Appends “IS A GREAT FLAVOR” to each one
Returns them
*/
const emphasizeFlavors = R.map(
  R.pipe(
    R.view(favoriteFlavor),
    R.toUpper,
    R.flip(R.concat)(" IS A GREAT FLAVOR")
  )
);

module.exports = { favoriteFlavor, emphasizeFlavors };
