const { lensProp, set, assoc, pipe } = require("ramda");

const meal = {
  id: 1,
  description: "Breakfast",
};

const brunch = {
  ...meal,
  description: "brunch",
};

const lensDescription = lensProp("description");
const setDescription = set(lensDescription);

const dinner = pipe(setDescription("dinner"), assoc("calories", 600))(meal);

console.log(meal, brunch, dinner);
