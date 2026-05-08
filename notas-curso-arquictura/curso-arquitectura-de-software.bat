Requisitos no funcionales
Restricciones
	tecnicas
	legales
	de negocio
response time
	tiempo de respuesta 
	tiempo de espera 
throughput
	numero de peticiones que nuestro sistema es capaz de procesar por unidad de tiempo
		puede ser incluso mas importante que el tiempo de respuesta 
	sistema que soporta una petición a  la vez. Tiempo de respuesta 100ms 
		se realiza cinco peticiones. tiempos de respuesta de cada una 100ms, 200ms, 300ms
	Histograma -> con esto es mas facial ver que servidor responde lento	
	media 
	mediana
Deciles
	es el tiempo de respuesta de los servidores
	 tail latency -> latencia de cola 
Requisitos	
	la mejor forma de ver el rendimiento es con un Histograma
Escalabilidad
	escalabilidad vertical
		aumentamos cpu, ram para tener un servidor mas potente 
	escalibilidad horizontal
		resiliente a fallos 
	Gestion del estado
		stateful services
			se almacena informacion en la memoria del servidor
		stateless services
			no se almacena informacion en la memoria del servidor se almacena en 	el cliente de cookies
			almacenes de datos. todos los servidores tienen acceso
		escalabilidad de la organizacion 
			añadir de forma rapida a un colaborador 
			el diseño de nuestro sistema tambien influye 
			monolitos es complicado que escale
			muchos mas repopositorios
Fiabilidad
	probabilidad de que el software se ejecute durante un determinado periodo de tiempo sin que se produzcan fallos	
		uptime: 
			tiempo que esta activo
		downtime
			tiempo que esta inactivo
		disponibilidad
			disponibilidad % = uptime / tiempo total
			es el teimpo que funciona sin problemas 
			uptime = (n servicios operativos / n servicios totales) * tiempo -> esto es cuando tenemos multiples servicios
			uptime = 
			otras metricas
		MTBF
			tiempo medio de fallo 
		MTTR
			tiempo medio para recuperar un fallo 
Mantenibilidad 
	observabilidad
	simplicidad
	extensibilidad
La complejidad en el desarrollo de software 
	
Componentes de un sistema a gran Escalabilidad	
	DNS -> protocolo subdominio dominio ruta query params
	servidor dns traduce la ip al nombre de dominio
	
	APIS -> 
	buenas practicas
		deben encapsular por completo nuestro sistema
		debe estar desacoplada de la logica interna
		versionado 
		operaciones idempotentes
		paginación
		utiliza operaciones asincronas
		
	load balancer : 
		algoritmos de balance de carga 
			algoritmos estaticos
				round robin: se reparte la carga de forma secuencial. 
				round robin ponderado: el administrador asigna pesos a cada servidor. los servidores con mayor peso recibiran mas peticiones
				hash de ip o url: se realiza ek hash de la direccion ip o de la url y se utiliza ese valor para asignar la peticion a un servidor
		algoritmos dinamicos:
			menor numero de conexiones: 
				se dirige la carta al servidor con menor numero de conexiones activas en ese momento
			menor tiempo de respuesta:
				se lleva un seguimiento del tiempo de respuesta de cada servidor y se envian las peticiones al que menor tiempo de respuesta presente
	ejemplos de servidores load balancer:
		nginx
		haproxy
		amazon elastic load balancer
		azure load balancer 
		google cloud load balancer
		
		
	api gateway:
		una unica api de entrada 
		aislamiento de nuestros sevicios: 
			posibilidad de refactorizar nuestro sistema interno sin afectar a los clientes
		seguridad y autenticacion centralizada
		monitorizacion centralizada
		cache y contenido estaticos
		gestion de trafico
	ejemplos de servidores para api gateway
		nginx
		spring cloud gateway
		express gateway
		amazon api gateway
		azure api management
		google cloud api gateway
		
	message broker:
		componente de software que facilita la comunicacion asincrona entre dos modulos de nuestro sistema
			productores
			consumidores
			colas 
			publicacion / suscripcion: los consumidores se suscriben a un topic los productores envian mensajes a un topic, el cual sera consumido por los suscriptores
	ejemplos de message brokers
		apapche kafka
		apache activemq
		tabbitmq
		aws sqs 
		azure service bus
			
		
	cache:
		es un area de almacenamiento temporal
			cache-aside: en este caso el sistema tiene la responsabilidad de obtener la informacion de la base de datos
			read-through : en este caso la propia cache tiene la responsabilidad de obtener la informacion de la base de datos
			write-through: en este caso se guarda en la cache y la cache guarda ese dato en al base de datos
			write-behing / write-back : la sincronizacion se hace de forma asincrona
			expiration policy
			eviction policy
				LRU: se elimina el dato que se hay consultado ultimamente
				LFU: se elimina el dato menos consultado
				FIFO: se elimina el dato que primero se haya insertado
	ejemplos de cache usados
		redis
		memcached
		spring cache
		caffeine
		aws elasticache
		microsoft azure cache for redis
	
	cdn: 
		los cdn son cache para los recursos estaticos
		estrategia pull
			el cdn solicita bajo demanda los recursos del servidor
		estrategia push
			el servidor envia al cdn los recursos cuando se añaden o modifican 
	ejemplos de cdn 
		cloudflare
		akamai
		amazon cloudfront
		google cloud cdn 
		microsoft azure cdn	
		
	data centers:
		balanceador de carga globales (GSLB) balancea entre regiones
Bases de datos
	documentales : mongodb
	clave-valor: redis, dynamondb
	orientado a columnas: apache cassandra
	grafos: neo4j
	series temporales: influxdb
nosql 
	no teienen un esquema predefinido: no es necesario conocer perfectamente la estructura de los datos con antelacion
	estructuras intuitivas para los programadores: objetos, listas, maps, grafos se elimina la necesidad de usar librerias externas como los orms
	pocos soportan transaccioens acid, siguen el modelo base: basically available, soft state, eventually consistent
	
Sharding
	tabien llamado particionamiento de datos
		se divide una gran bbdd en pequeñas partes mas faciles de manejar, shards
		
	clave de sharding o partition key
		una o mas columanas de una tabla que determinan como se distribuyen los datos
	
	Sharding basado en rango 
		se almacena en cada shard los datos generados en un rango temporal
		muy eficiende para consultas de rango 
		desequilibrio en las cargas de cada shard
	Sharding basado en hashing
		Se aplica funcion hash a la clave y se asigna a un shard en funcion del resultado 
		distribuye uniformemente la carga 
		ineficiente para consultas por rango. Los dataos se encuentran en shards distintos
	Sharding basado en listas predefinidas 
		Se establece una lista de valores predefinidos para casa shard. Asignacion manual
		Nos ofrece un control granular sobre la informacion que se distribuye a cada shard
		Desequilibrio en las cargas de cada shard si las listas no estan bien diseñadas
	Sharding roud robin
		Se inserta el primer elemento en el primer shard, el segundo en el segundo etc.
		Algoritmo muy simple. Ademas cada shard tendra un numero similar de datos
		Problema al localizar los datos.
			No depende de la clave de particionado 
			Debemos mantener una estructura auxiliar que mapee cada dato al shard asignado
		
Teorema CAP - Brewer
	En un sitama distribuido de datos, es posible garantizar simultaneamente.
	consistencia : Todos los nodos de nuestro sistema ven la misma informacion en todo momento 
					se devuelve la escritura mas reciente o un error 
	
	disponibilidad: Prioriza no devolver errores, pero no se garantiza que se devuelva el valor mas reciente
					clientes diferentes pueden ver distintos datos
					
	tolerancia a particiones de red: El sistema sigue funcionando a pesar  de que existan problemas de comunicacion entre distintos nodos.
	Configuraciones 
		CA, -> sacrifica la tolerancia a particiones de red 		
		AP, -> sacrifica la consistencia
		CP, -> sacrifica la disponibilidad

PATRONES DE ARQUITECTURA DE SOFTWARE
	
	Arquitecura multi layer: 
	Arquitectura multi tier:
	Microservicios:
	CQRS: 
		se divide en dos stack uno de lectura y uno de escritura 
	EVENT SOURCING:
		sistemas que almacenan el estado como una secuencia de eventos
		
	
		
