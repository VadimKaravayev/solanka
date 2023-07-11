console.log("The script is running");

const getNum = (num) => {
  const dfd = $.Deferred();
  if (num > 5) {
    dfd.resolve("Good job, " + num);
  } else {
    dfd.reject("Not this time, " + num);
  }
  return dfd;
};

const getResult = (num) => {
  const $div = $(".result");
  getNum(num)
    .done((data) => $div.html(data))
    .fail((err) => $div.html(err));
};

const moviesUrl = "http://127.0.0.1:3001/movies";

const getAlwaysMovies = () => {
  $.get(moviesUrl).always((data) => console.log(data));
};

const getMovies = () => {};
