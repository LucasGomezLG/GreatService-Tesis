const express = require('express')
const personaService = express.Router()

personaService.get('/all', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('SELECT * FROM persona', (err, rows) => {
            if(err) return res.send(err)

            res.json(rows)
        })
    })
})

personaService.get('/:id', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('SELECT * FROM persona WHERE id_per = ?', [req.params.id], (err, rows) => {
            if(err) return res.send(err)

            res.json(rows)
        })
    })
})

personaService.post('/add', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('INSERT INTO persona set ?', [req.body],(err, rows) => {
            if(err) return res.send(err)

            res.send('Se agrego una persona')
        })
    })
})

personaService.delete('/delete/:id', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('DELETE FROM persona where id_per = ?', [req.params.id],(err, rows) => {
            if(err) return res.send(err)

            res.send('Se elimino una persona')
        })
    })
})

personaService.put('/update/:id', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('UPDATE persona set ? WHERE id_per = ?', [req.body, req.params.id],(err, rows) => {
            if(err) return res.send(err)

            res.send('Se actualizo una persona')
        })
    })
})

module.exports = personaService