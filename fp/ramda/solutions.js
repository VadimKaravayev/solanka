const R = require("ramda");

const toUsd = (amount) =>
  amount.toLocaleString("en-US", {
    style: "currency",
    currency: "USD",
  });

//Arrays<Object> => Number
const getTotalPrice = R.pipe(R.pluck("price"), R.sum, toUsd);

//Array<Object> => String
const getCheapestItem = R.pipe(
  R.reduce(R.minBy(R.prop("price")), { price: Infinity }),
  R.prop("name")
);

//(Number, Array<Object>) => Array<Object>
const getTop3MealsFor = R.curry((price, menu) => {
  const maxPrice = R.propSatisfies(R.lte(R.__, price));
  const filterByMaxPrice = R.filter(maxPrice);
  const sortByRatingDesc = R.sort(R.descend(R.prop("rating")));
  return R.pipe(filterByMaxPrice, sortByRatingDesc, R.take(3))(menu);
});

// Get salaries
// Reject anything below $100,000
// Get the median
// Calculate monthly paycheck (amount / 12 months)
// Format dollars (USD)

//Array<Object> => String
const getMedianPaycheck = R.pipe(
  R.pluck("salary"),
  R.filter(R.lte(100000)),
  R.median,
  R.divide(R.__, 12),
  toUsd
);

const getResult = (text) => R.pipe(R.toString, R.flip(R.concat)(text));

const getScore = R.cond([
  [R.lte(800), getResult(" is excellent!")],
  [R.lte(700), getResult(" is good!")],
  [R.lte(650), getResult(" is fair!")],
  [R.gte(649), getResult(" is poor")],
]);

const reviewCreditScores = R.map(getScore);

module.exports = {
  getTotalPrice,
  getCheapestItem,
  getTop3MealsFor,
  getMedianPaycheck,
  reviewCreditScores,
};
