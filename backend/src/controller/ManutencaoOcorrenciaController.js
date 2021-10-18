const OcorrenciaRepository = require("../repository/OcorrenciaRepository");

module.exports = {
  /**
   * @api {post} /ocorrencia Incluir Ocorrência
   * @apiGroup Ocorrências
   * @apiDescription Endpoint de inclusão de novas ocorrências
   * 
   * @apiSuccessExample {json} Sucesso
   *    HTTP/1.1 200 OK
   *    
   *    {
   *      "id": 1,
   *      "descricao": "Buraco na BR-470",
   *      "situacao": "PENDENTE",
   *      "latitude": 0,
   *      "longitude": 0,
   *      "data": "18/10/2021"
   *    }
   *
   * @apiErrorExample Erro de Validação no Formulário
   *     HTTP/1.1 400 Bad request
   *
   *      {
   *        "msg": "O campo \"Descrição\" é obrigatório!"
   *      }
   *
   */
  novaOcorrencia(request, response) {
    const { descricao, latitude, longitude } = request.body;
    
    if(!descricao) {
      return response.status(400).json({ msg: 'O campo "Descrição" é obrigatório!' })
    }

    if(!latitude || !longitude) {
      return response.status(500).json({ msg: 'Coordenadas não informadas' })
    }

    const registro = OcorrenciaRepository.insereOcorrencia(descricao, latitude, longitude);
    return response.json(registro);
  },
}