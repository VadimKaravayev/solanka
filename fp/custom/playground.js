const ifElse = (predicate, action1, action2) => {
    return predicate ? action1() : action2();
}