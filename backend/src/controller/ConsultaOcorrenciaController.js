const OcorrenciaRepository = require("../repository/OcorrenciaRepository");

module.exports = {
  
  /**
   * @api {get} /ocorrencia Listar Ocorrências
   * @apiGroup Ocorrências
   * @apiDescription Endpoint de listagem de ocorrências
   * 
   * @apiSuccessExample {json} Sucesso
   *    HTTP/1.1 200 OK
   *    [
   *      {
   *        "id": 1,
   *        "descricao": "Buraco na BR-470",
   *        "situacao": "PENDENTE",
   *        "latitude": 0,
   *        "longitude": 0,
   *        "data": "18/10/2021"
   *      }
   *    ]
   *
   */
  getPendentes(request, response) {
    const ocorrencias = OcorrenciaRepository.getOcorrencias()
    return response.json(ocorrencias);
  },
}