function curry(fn) {
  return function curried(...args) {
    if (args.length >= fn.length) {
      return fn.apply(this, args);
    } else {
      return function (...args2) {
        return curried.apply(this, args.concat(args2));
      };
    }
  };
}

const pipe = (...fns) => x =>  fns.reduce((val, fn) => fn(val), x);
const sum = curry((a, b) => a + b);
const multiply = curry((a, b) => a * b);

const pipedFn = pipe(sum(1), multiply(2));

console.log(pipedFn(6));


const mustard = (fn) => {
    const mustarded = (...args) => args.length >= fn.length
            ? fn.apply(null, args)
            : (...args2) => mustarded.apply(null, args.concat(args2));


    return mustarded;
}

const foo = (a, b) => a + b;
const bar = mustard(foo);
console.log(bar(2)(32));