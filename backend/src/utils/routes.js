const { Router } = require('express');
const multer  = require('multer');
const path = require('path');
const ConsultaOcorrenciaController = require('../controller/ConsultaOcorrenciaController');
const ManutencaoOcorrenciaController = require('../controller/ManutencaoOcorrenciaController');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, './uploads/' );
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});

const routes = Router();

const upload = multer({ storage: storage });
routes.post('/ocorrencia', upload.single('imagem'), ManutencaoOcorrenciaController.novaOcorrencia);

routes.get('/ocorrencia', ConsultaOcorrenciaController.listaOcorrencias);
routes.put('/ocorrencia/:id/pendente', ManutencaoOcorrenciaController.alteraSituacaoPendente)
routes.put('/ocorrencia/:id/resolvido', ManutencaoOcorrenciaController.alteraSituacaoResolvido)
routes.delete('/ocorrencia/:id', ManutencaoOcorrenciaController.excluirOcorrencia)

module.exports = routes;
