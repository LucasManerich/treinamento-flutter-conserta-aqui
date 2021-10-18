const express = require('express');
const cors = require('cors');
const dotEnv = require('dotenv')
const routes = require('./utils/routes');

dotEnv.config()

// inicia o servidor http
const app = express();

app.use(cors());
app.use(express.json());
app.use(routes);

const porta = process.env.PORTA || 3131;
app.listen(porta, () => {
  console.log(`Servidor executando na porta ${porta}`)
});