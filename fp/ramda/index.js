const R = require("ramda");
const cart = require("./cart");
const menu = require("./menu");
const employees = require("./employees2");

const {
  getTotalPrice,
  getCheapestItem,
  getTop3MealsFor,
  getMedianPaycheck,
  reviewCreditScores,
} = require("./solutions");

const { favoriteFlavor, emphasizeFlavors } = require("./lensesExercises");

const ratings = [740, 550, 681, 805];

const result = emphasizeFlavors(employees);

console.log({ result });
