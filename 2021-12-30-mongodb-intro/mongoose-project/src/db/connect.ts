import mongoose from 'mongoose';

let connection : Promise<typeof mongoose>;
const mongoURI = process.env.MONGO_URI ?? 'mongodb://localhost';

export default () => {
    if(!connection){
        connection = mongoose.connect(mongoURI);
    }

    return connection;
}