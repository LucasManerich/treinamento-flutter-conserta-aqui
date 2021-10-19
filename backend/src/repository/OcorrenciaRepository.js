const OcorrenciaSituacao = require('../enum/OcorrenciaSituacao');
const db = require('../utils/database');

const OcorrenciaRepository = {
  /**
   * Realiza a geração de um ID
   */
  geraId() {
    const ultimoItem = db.get('ocorrencias').takeRight(1).first().value();
    let proximoId = 1;
    
    // se existirem ocorrencias na base de dados, vamos buscar pelo ID do último elemento e incrementar o número
    if(ultimoItem) {
      const { id } = ultimoItem;
      proximoId = id + 1;
    }

    return proximoId;
  },

  /**
   * Insere uma ocorrencia na base de dados
   */
  insereOcorrencia(descricao, latitude, longitude) {
    // busca a data atual
    const data = new Date().toLocaleDateString('pt-br');
    
    const item = {
      id: this.geraId(),
      descricao: descricao,
      latitude: latitude,
      longitude: longitude,
      situacao: OcorrenciaSituacao.Pendente,
      data: data, 
    }

    // salva na base de dados
    db.get('ocorrencias').push(item).write();
    
    return item
  },

  /**
   * Retorna todas as ocorrencias
   */
  getOcorrencias() {
    return db.get('ocorrencias').value();
  },

  /**
   * Exclui uma ocorrencia
   */
  excluiOcorrencia(id) {
    db.get('ocorrencias').remove({ id }).write();
  },

  /**
   * Altera a situação da ocorrencia
   */
  alteraSituacaoOcorrencia(situacao, id) {
    db.get('ocorrencias').find({ id }).assign({ situacao }).write();
  }
}

module.exports = OcorrenciaRepository;