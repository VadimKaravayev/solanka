const http = require("http");
const path = require("path");
const fs = require("fs");

const host = "localhost";
const port = 3000;

const server = http.createServer((req, res) => {
  const url = ["/", "index.html"].includes(req.url) ? "index.html" : req.url;
  const filePath = path.join(__dirname, "public", url);
  console.log(req.url);
  console.log(req.method);
  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.statusCode = 404;
      res.end("File not found");
    } else {
      res.statusCode = 200;
      res.setHeader("Content-Type", "text/html");
      res.end(data);
    }
  });
});

server.listen(port, host, () => {
  console.log(`Server running on ${host}:${port}`);
});
