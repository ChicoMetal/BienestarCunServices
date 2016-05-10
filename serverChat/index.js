var express = require('express'),
	http	= require('http'),
	socket 	= require('socket.io'),
	mysql	= require('mysql');


//configurar conexion a la BD
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'node'
})

//crear aplicacion
var app 	= express();
var server	= http.createServer(app);
var io 		= socket(server);




//configurar motor de plantillas
app.set('views', __dirname+'/app/views');
app.set('view engine', 'jade');
app.locals.pretty = true;

//configurar archivos estaticos
app.use('/bower_components', express.static(__dirname+'/bower_components') );

//obtener mensajes guardados en la BD
app.get('/messages', function(req, res){
	var query = "SELECT cp.Id, cp.Mensaje\
				FROM chatpsicologia cp\
				WHERE cp.Remitente = '$receptor' AND cp.Estado = FALSE\
				ORDER BY cp.Fecha";

	connection.query(query, function(err, message){
		if( err)
			console.log("Error en ejecucion del query..."+ err );

		res.header('Content-Type', 'application/json');
		res.send(message);
	});
});

//creando rutas de la aplicacion
app.get('/', function(req, res){
	res.render('index');
});

//configurar socket.io para escuchar eventos desde el cliente
io.on('connection', function(socket){
	console.log('Usuario conectado');

	//Al enviarse un mensaje desde el cliente
	socket.on('new message', function(message){
		console.log(message.Usuario+" ha enviado un mensaje");
		//guardar mensaje en la BD
		var query = 'chatpsicologia(Mensaje, Remitente, Destinatario) SET ?';

		connection.query( query, message, function(err, result){
			if( err )
				console.log("Error en ejecucion del query..."+err);

			io.emit('new message', message);
		});

	});

	socket.on('disconnect', function(){
		console.log('Usuario desconectado..');
	});
});

//iniciar el servidor
server.listen(3000, function(){
	console.log('Server iniciado en el puerto 3000');
});