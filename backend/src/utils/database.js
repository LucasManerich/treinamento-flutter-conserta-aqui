
// cria a conexão com o BD
const low = require('lowdb');
const FileSync = require('lowdb/adapters/FileSync');

const adapter = new FileSync('banco-de-dados.json');
const db = low(adapter);

// cria a estrutura padrao da base dados
db.defaults({ ocorrencias: [] }).write()

module.exports = db;