const express = require('express')
const usuarioService = express.Router()

usuarioService.get('/all', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('SELECT * FROM usuario', (err, rows) => {
            if(err) return res.send(err)

            res.json(rows)
        })
    })
})

usuarioService.get('/:id', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('SELECT * FROM usuario WHERE id_usu = ?', [req.params.id], (err, rows) => {
            if(err) return res.send(err)

            res.json(rows)
        })
    })
})


usuarioService.post('/add', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('INSERT INTO usuario set ?', [req.body],(err, rows) => {
            if(err) return res.send(err)

            res.send('Se agrego un usuario')
        })
    })
})

usuarioService.delete('/delete/:id', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('DELETE FROM usuario where id_usu = ?', [req.params.id],(err, rows) => {
            if(err) return res.send(err)

            res.send('Se elimino un usuario')
        })
    })
})

usuarioService.put('/update/:id', (req, res) =>{
    req.getConnection((err, conn) => {
        if(err) return res.send(err)

        conn.query('UPDATE usuario set ? WHERE id_usu = ?', [req.body, req.params.id],(err, rows) => {
            if(err) return res.send(err)

            res.send('Se actualizo un usuario')
        })
    })
})

module.exports = usuarioService