const fs = require('fs');
const OcorrenciaSituacao = require("../enum/OcorrenciaSituacao");
const OcorrenciaRepository = require("../repository/OcorrenciaRepository");

module.exports = {
  /**
   * @api {post} /ocorrencia Incluir Ocorrência
   * @apiGroup Ocorrências
   * @apiDescription Endpoint de inclusão de novas ocorrências
   * 
   * @apiSuccess {File}   imagem     Imagem da Ocorrência
   * @apiSuccess {String} descricao  Descrição
   * @apiSuccess {String} latitude   Latitude da Ocorrência
   * @apiSuccess {String} longitude  Longitude da Ocorrência
   * @apiSuccessExample {json} Sucesso
   *    HTTP/1.1 200 OK
   *    
   *    {
   *      "id": 1,
   *      "descricao": "Buraco na BR-470",
   *      "situacao": "PENDENTE",
   *      "latitude": 0,
   *      "longitude": 0,
   *      "data": "18/10/2021",
   *      "imagem": "123109321.jpg"
   *    }
   */
  novaOcorrencia(request, response) {
    const { filename } = request.file;
    const { descricao, latitude, longitude } = request.body;
    
    if(!descricao) {
      return response.status(400).json({ msg: 'O campo "Descrição" é obrigatório!' })
    }

    if(!latitude || !longitude) {
      return response.status(500).json({ msg: 'Coordenadas não informadas' })
    }

    const registro = OcorrenciaRepository.insereOcorrencia(descricao, latitude, longitude, filename);
    return response.json(registro);
  },
  
  /**
   * @api {delete} /ocorrencia/:id Excluir Ocorrência
   * @apiGroup Ocorrências
   * @apiDescription Endpoint de exclusão de ocorrências
   * @apiParam {Integer} id ID da Ocorrência
   * 
   * @apiSuccessExample {json} Sucesso
   *    HTTP/1.1 200 OK
   *    
   *    {
   *      "sucesso": true,
   *    }
   */
  excluirOcorrencia(request, response) {
    const { id } = request.params;
    if(!id) {
      return response.status(400).json({ msg: 'Parâmetro "ID" não informado' })
    }

    OcorrenciaRepository.excluiOcorrencia(Number(id));
    return response.json({ sucesso: true });
  },

  /**
   * @api {put} /ocorrencia/:id/pendente Definir Situação como Pendente
   * @apiGroup Ocorrências
   * @apiDescription Endpoint de alteração da situação da ocorrência
   * @apiParam {Integer} id ID da Ocorrência
   * 
   * @apiSuccessExample {json} Sucesso
   *    HTTP/1.1 200 OK
   *    
   *    {
   *      "sucesso": true,
   *    }
   */
  alteraSituacaoPendente(request, response) {
    const { id } = request.params;
    if(!id) {
      return response.status(400).json({ msg: 'Parâmetro "ID" não informado' })
    }
    OcorrenciaRepository.alteraSituacaoOcorrencia(OcorrenciaSituacao.Pendente, Number(id))
    return response.json({ sucesso: true });
  },

  /**
   * @api {put} /ocorrencia/:id/resolvido Definir Situação como Resolvido
   * @apiGroup Ocorrências
   * @apiDescription Endpoint de alteração da situação da ocorrência
   * @apiParam {Integer} id ID da Ocorrência
   * 
   * @apiSuccessExample {json} Sucesso
   *    HTTP/1.1 200 OK
   *    
   *    {
   *      "sucesso": true,
   *    }
   */
  alteraSituacaoResolvido(request, response) {
    const { id } = request.params;
    if(!id) {
      return response.status(400).json({ msg: 'Parâmetro "ID" não informado' })
    }
    OcorrenciaRepository.alteraSituacaoOcorrencia(OcorrenciaSituacao.Resolvido, Number(id))
    return response.json({ sucesso: true });
  },
}