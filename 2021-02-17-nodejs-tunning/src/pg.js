const { Pool } = require('pg');

module.exports.PgPool = () => {
    const pool = new Pool({
        database: 'postgres',
        user: 'postgres',
        password: 'password',
    });
    return pool;
}