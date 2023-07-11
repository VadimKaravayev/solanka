const makeMapTransducer = mapper => reducer => (acc, val) => reducer(acc, mapper(val));
const makeFilterTransducer = predicate => reducer => (acc, val) => predicate(val) ? reducer(acc, val) : acc;

const composeTransducers = (transducerOne, transducerTwo) => reducer => transducerOne(transducerTwo(reducer));
const concat = (acc, val) => acc.concat(val);

const addOneTransducer = makeMapTransducer(val => val + 1);
const timesTwoTransducer = makeMapTransducer(val => val * 2);

const addOneAndDoubleTransducer = composeTransducers(addOneTransducer, timesTwoTransducer);

const reducingFn = addOneAndDoubleTransducer(concat);

const result = [1,2,3,4,5].reduce(reducingFn, []);

const isEvenTransducer = makeFilterTransducer(x => x % 2 === 0);

console.log([1,2,3,4,5, 6].reduce(isEvenTransducer(concat), []));

