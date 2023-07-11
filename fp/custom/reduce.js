const reduce = (reducer, acc, arr) => {
    if (arr.length === 0) {
        return acc;
    }
    const [head, ...tail] = arr;
    const newAcc = reducer(acc, head);
    return reduce(reducer, newAcc, tail);
}



const result = reduce((acc, val) => acc + val, 0, [1,2,3,4,5,6]);
console.log(result)