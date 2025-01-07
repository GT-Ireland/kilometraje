const corsOptions = {
    origin: function (origin, callback) {
        console.log('Request Origin:', origin);
        const allowedOrigins = [
            'http://0.0.0.0',
            'http://127.0.0.1:5502',
            'http://localhost',
            'http://192.168.1',
            'http://192.168.16.148',
            'http://192.168.16.142',
            'http://192.168.16.142:80',
            'http://kilometraje.local',
            'http://kilometraje.cisa',
            'http://192.168.16.148/index.html'
        ];

        if (!origin) return callback(null, true);

        if (allowedOrigins.indexOf(origin) !== -1 || /^http:\/\/192\.168\.1\.\d+$/.test(origin)) {
            callback(null, true);
        } else {
            callback(new Error('Not allowed by CORS'));
        }
    },
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    preflightContinue: false, //& Checks if the server allows the actual request's HTTP IS SET TO FALSE SO IT REPLIES DIRECTLY TO CORS AND NOT MIDDLE WARE 
    optionsSuccessStatus: 204
};
module.exports = cors(corsOptions);