const axios= require('axios');
const express= require('express');

const app = express()
const port = 8080

async function runScript() {
  const result =  axios.get('https://genlab-dev-ed.my.salesforce.com/services/apexrest/v1/leadApi', {
    headers: {
      Authorization: 'Bearer 00D8b0000013cPc!AQkAQPuZJfxwEI9KH9OlMN8v0SfqH9xWc8SkFw7EeA7PBqkpAVcGspw2u2SPw4ViWPB2rodCbwsLOUanEGJyXYpRMyxNR0Wf',
  }});
  return result;
}

app.get('/', (req, res) => {
  runScript()
    .then(result => res.json(result.data));
})

app.listen(port, () => {
  console.log(`Server proxy running on ${port}`)
})