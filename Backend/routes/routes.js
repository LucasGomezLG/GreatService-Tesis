const express = require('express')
const routes = express.Router()
const personaService = require('../services/personaService')
const usuarioService = require('../services/usuarioService')

routes.use('/persona', personaService)
routes.use('/usuario', usuarioService)

module.exports = routes