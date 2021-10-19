const { Router } = require('express');
const ConsultaOcorrenciaController = require('../controller/ConsultaOcorrenciaController');
const ManutencaoOcorrenciaController = require('../controller/ManutencaoOcorrenciaController');

const routes = Router();

routes.get('/ocorrencia', ConsultaOcorrenciaController.listaOcorrencias);
routes.post('/ocorrencia', ManutencaoOcorrenciaController.novaOcorrencia);
routes.put('/ocorrencia/:id/pendente', ManutencaoOcorrenciaController.alteraSituacaoPendente)
routes.put('/ocorrencia/:id/resolvido', ManutencaoOcorrenciaController.alteraSituacaoResolvido)
routes.delete('/ocorrencia/:id', ManutencaoOcorrenciaController.excluirOcorrencia)
module.exports = routes;
