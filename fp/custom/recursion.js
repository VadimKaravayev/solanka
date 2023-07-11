const printReverse = arr => {
    if (!arr.length) {
        return;
    }

    printReverse(arr.slice(1));

    console.log(arr[0]);
}

printReverse([1,2,3,4,5,6]);