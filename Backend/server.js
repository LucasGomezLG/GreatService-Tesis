const express = require('express')
const mysql = require('mysql')
const myconn = require('express-myconnection')
const app = express()
const routes = require('./routes/routes')

app.set('port', process.env.PORT || 8000)

const dbOptions = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'servicesgreat',
}

app.use(myconn(mysql, dbOptions, 'single'))
app.use(express.json())

app.get('/', (req,res) => {
    res.send('Bienvenido al API de GreatService')
})

app.use('/api', routes)

app.listen(app.get('port'), () => {
    console.log('Server running on port', app.get('port'))
}) 