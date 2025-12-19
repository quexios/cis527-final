const express = require('express');
const axios = require('axios');
const app = express();
app.use(express.json());

app.post('/api/contact', async (req, res) => {
    const { name, email, message } = req.body;
    await axios.post(process.env.DISCORD_WEBHOOK_URL, {
        content: `**New Message!**\n**From:** ${name}\n**Email:** ${email}\n**Message:** ${message}`
    });
    res.sendStatus(200);
});

app.listen(3000);