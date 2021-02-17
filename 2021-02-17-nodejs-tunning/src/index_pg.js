const http = require('http');
const QueryStream = require('pg-query-stream')
const JSONStream = require('JSONStream')
const { PgPool } = require('./pg');

(async () => {
    const pool = PgPool();
    const client = await pool.connect();
    const query = new QueryStream(`select * from users`);
    http.createServer(async (req, res) => {
        try {
            const stream = client.query(query);
            stream.on('data', async (chunk) => {
                console.log(chunk)
                stream.pause();
                await new Promise(r => setTimeout(r, 1000));
                stream.resume();
            });
            res.writeHead(200, { 'content-type': 'application/json ' });
            stream.pipe(JSONStream.stringify()).pipe(res);
        } catch (err) {
            console.error(err);
            res.writeHead(500, { 'content-type': 'plain/text ' });
            res.end('Internal Error\n');
        }
    }).listen(8080);
})();