require('dotenv').config()
var db = require("../database-mysql");
// const router = require('express').Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

module.exports.login = (req, res) => {

  const { email, password } = req.body
  let queryStr = `SELECT * from User where email="${email}"`
  db.query(queryStr, async (err, results) => {
    if (err) {
      res.status(500).send({ error: "There was an error connecting to the DB" })
    }
    if (results.length === 0) {
      res.status(404).send({ error: 'no user with that email' })
      return;
    }
    console.log(results[0])
    const valid = await bcrypt.compare(password, results[0].password)
    if (!valid) {
      res.status(404).send({ error: "incorrect password" });
      return;
    } else {
      const token = jwt.sign({id: results[0].id}, process.env.SECRET, {
        expiresIn: '4h'
      })
      res.status(200).send({ user: results[0], token })
    }
  })
}
module.exports.signup = (req, res) => {
  const { email, password, first_name, last_name, front_id_img, back_id_img } = req.body
  let queryStr = `SELECT * from User where email="${email}"`
  db.query(queryStr, async (err, results) => {
    if (err) {
      res.status(404).send({ error: "There was an error connecting to the DB" })
    }
    if (results.length !== 0) {
      res.status(404).send({ error: 'User already exists' })
      return;
    }
    const hashedPassword = bcrypt.hashSync(password, 10)
    const params = [
      first_name,
      last_name,
      front_id_img,
      back_id_img,
      email,
      hashedPassword]
    let syntax = 'INSERT into User (first_name,last_name,front_id_img,back_id_img,email,password) values (?,?,?,?,?,?)'
    db.query(syntax, params, (err, results) => {
      if (err) {
        console.log(err)
        res.status(500).send({ error: "There was an error connecting to the DB" })
      } else {
        const token = jwt.sign({id: results.insertId}, process.env.SECRET, {
          expiresIn: '4h'
        })
        res.status(201).send({
          user: {...req.body, id: results.insertId ,password: hashedPassword},
          token
        })
      }
    })

  })
}
module.exports.verify = (req, res) => {
  const { token } = req.body
  try {
    const userId = jwt.verify(token, process.env.SECRET)
    console.log(userId)
    let queryStr = `SELECT * from User where id="${userId.id}"`
    db.query(queryStr, async (err, results) => {
      if (err) {
        res.status(500).send({ error: "There was an error connecting to the DB" })
      } else {
        if (results.length === 0) {
          res.status(400).send({ error: 'no user with that token' })
        } else {
          res.status(200).send({user: results[0]})
        }
      }
    })
  }
  catch (error) {
    res.status(400).send({error: "Unvalid Token"})
  }
}


