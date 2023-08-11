const employees = require("./employees.json");
const users = require("./users.json");
const {
  median,
  pluck,
  pipe,
  reject,
  map,
  curry,
  tap,
  compose,
  path,
  sort,
  ascend,
  descend,
  prop,
  ifElse,
  always,
  equals,
  cond,
  lensProp,
  view,
  over,
  lensPath,
  assoc,
  lens,
  set,
  countBy,
  gt,
  lt,
  count,
} = require("ramda");

const upperAndReverseFirstName = (user) => {
  const { firstName } = user;
  const upperCaseName = firstName.toUpperCase();
  const arr = upperCaseName.split("");
  const reversed = arr.toReversed();
  return reversed.join("");
};

const upperNames = map(upperAndReverseFirstName);

const result = upperNames(users);

const sortBySalaryAsc = sort(ascend(prop("salary")));

const foo = always("foo");

const fooCond = ifElse(equals("foo"), always("Thas's foo"), always("Not foo"));

//map(fn, functor)

const bySalary = pipe(prop("salary"), lt(50000));

const res = count(bySalary)(employees);

console.log(Maybe.Just(false));
