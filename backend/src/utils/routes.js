const { Router } = require('express');
const ConsultaOcorrenciaController = require('../controller/ConsultaOcorrenciaController');
const ManutencaoOcorrenciaController = require('../controller/ManutencaoOcorrenciaController');

const routes = Router();

routes.get('/ocorrencia', ConsultaOcorrenciaController.getPendentes);
routes.post('/ocorrencia', ManutencaoOcorrenciaController.novaOcorrencia);

module.exports = routes;