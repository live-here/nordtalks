import express from 'express';
import cors from 'cors';
const app = express();

app.use(cors());
app.use(express.json());
app.get('/', async (req, res, next) => {
    res.json({})
})

app.get('/:id', (req, res, next) => {
    res.json({})
})

app.post('/', async (req, res, next) => {
    res.json({})
})

app.put('/:id', (req, res, next) => {
    res.json({})
})

app.delete('/:id', (req, res, next) => {
    res.json({})    
})

export default app;