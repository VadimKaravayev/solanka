const path = require("path");
const fs = require("fs");

const filePath = path.join(__dirname, "public", "index.html");

console.log(filePath);

fs.readFile(filePath, (err, data) => {
  if (err) {
    console.log(err);
  }
  console.log(data);
});
