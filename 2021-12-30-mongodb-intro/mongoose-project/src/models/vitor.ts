import mongoose, { Schema } from 'mongoose';

const vitorSchema = new Schema({
    indiceAlcoolico: Number,
    nome: String,
},{
    timestamps: true,
});

export default mongoose.model('Vitor', vitorSchema);