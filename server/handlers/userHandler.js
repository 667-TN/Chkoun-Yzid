// const User = require("../controllers/user.controller.js")
// // const Controller = require("../controllers/index.js");

// const mysql = require('mysql');
// const bcrypt = require('bcrypt');
// const jwt = require('jsonwebtoken');

// const createUser = (req, res) => {

//     bcrypt.genSalt(10, function (err, salt) {
//         bcrypt.hash(req.body.password, salt, function (err, hash) {
//             User.createUser([req.body.first_name, req.body.last_name, req.body.front_id_img, req.body.back_id_img, req.body.email, hash], (err, result) => {
//                 err ? console.log(err) : res.status(201).send(result)
//             })
//         })

//     })
// }
// const login = (req, res) => {

//     User.Login(req.body.email, (err, result) => {
//         if (result.length > 0) {
//             bcrypt.compare(req.body.password, result[0].password, (err, result) => {
//                 if (err) {
//                     return res.status(404).json({
//                         message: 'Authentication failed'
//                     })
//                 } else {
//                     if (result) {
//                         const token = jwt.sign({
//                             email: req.body.email,
//                             userId: req.params.id,
//                             role: "user"
//                         }, 'secret', function (err, token) {
//                             res.status(200).json({
//                                 message: " authentication sucessful !",
//                                 token: token
//                             })
//                         })
//                     } else {
//                         res.status(404).json({ message: 'Wrong Password!' })
//                     }
//                 }


//             })
//         }
//     })
// }

// module.exports = {
//     login,
//     createUser
// }



