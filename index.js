const express = require("express");
// const studentRoutes = require('./routes/student.routes')

 const db = require('./server/database-mysql');

const app = express();
const PORT = process.env.PORT || 3000


app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(__dirname + "/../client/dist"));

// app.use("/api/student", studentRoutes);

app.listen(PORT, function () {
  console.log("listening on port 3000!");
});
