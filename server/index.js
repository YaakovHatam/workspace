import express from 'express';

const PORT = 6556;
const app = express();

app.use('/images', express.static('images'))

app.get('/api/hello', function (req, res) {
    res.send('hello');
});

app.listen(PORT, () => console.log(`Server up at port ${PORT}`));