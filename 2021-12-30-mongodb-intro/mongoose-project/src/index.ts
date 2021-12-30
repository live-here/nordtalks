import 'dotenv/config';
import app from './app';
import dbConnection from './db/connect';

const port = process.env.PORT ?? 3001;

dbConnection().then(() => {
    app.listen(port, () => console.log(`Server listening on port ${port}!`));
}).catch(console.error)
