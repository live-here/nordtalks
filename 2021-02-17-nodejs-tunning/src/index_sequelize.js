const http = require('http');
const { Sequelize, Users } = require('./sequelize');

(async () => {
    const sequelize = await Sequelize();
    http.createServer(async (req, res) => {
        try {
            const rows = await Users.findAll();
            res.writeHead(200, { 'content-type': 'application/json ' });
            res.end(JSON.stringify(rows, null, 2) + '\n');
        } catch (err) {
            console.error(err);
            res.writeHead(500, { 'content-type': 'plain/text ' });
            res.end('Internal Error\n');
        }
    }).listen(8080);
})();