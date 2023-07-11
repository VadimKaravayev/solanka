const form = document.querySelector("#form");
form.addEventListener("submit", (e) => {
  e.preventDefault();

  const elements = e.target.elements;
  for (let { name, value } of elements) {
    console.log(name, value);
  }

  const formData = new FormData(form);
  for (let [name, val] of formData) {
    console.log(name, val);
  }
});
