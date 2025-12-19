const express = require('express');
const axios = require('axios');
const app = express();
app.use(express.json());

app.post('/contact', async (req, res) => {
    const { name, email, message } = req.body;
    await axios.post(process.env.DISCORD_WEBHOOK_URL, {
        content: `**New Message!**\n**From:** ${name}\n**Email:** ${email}\n**Message:** ${message}`
    });
    res.sendStatus(200);
});

const PORT = 3000;
app.listen(PORT, '0.0.0.0', () => {
    console.log(`Backend listening on port ${PORT}`);
});