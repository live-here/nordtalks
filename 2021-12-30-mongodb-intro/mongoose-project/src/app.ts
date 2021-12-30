import express from 'express';
import cors from 'cors';
import VitorModel from './models/vitor';

const app = express();

app.use(cors());
app.use(express.json());
app.get('/', async (req, res, next) => {
    res.json(await VitorModel.find())
})

app.get('/:id', async (req, res, next) => {
    const {id} = req.params
    res.json(await VitorModel.findById(id))
})

app.post('/', async (req, res, next) => {
    const vitorData = req.body;
    res.json(await VitorModel.insertMany(vitorData))
})

app.put('/:id', async (req, res, next) => {
    const {id} = req.params;
    const vitorData = req.body;
    res.json(await VitorModel.findByIdAndUpdate(id, vitorData))
})

app.delete('/:id', async (req, res, next) => {
    const {id} = req.params;
    res.json(await VitorModel.findByIdAndDelete(id))    
})

export default app;