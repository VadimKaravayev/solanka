const foo = (function () {
  const bar = () => console.log("bar bar bar");

  return {
    baz: bar,
  };
})();
