#DESARROLLO DE APLICACIONES WEB
#“Atención en línea en restaurante de comidas rápidas”

[TOC]

##Objetivo:
Introducir los conceptos relacionados con la construcción de aplicaciones Web basadas en HTML5, CSS3, Javascript, PHP y Frameworks como Laravel.

##Prerrequisitos:
Esta práctica debe ser realizada con:
Apache Httpd Server 2.x o superior. (Opcional: XAMPP)
Mysql 5.x o superior.
PHP 5.x o superior.
Laravel Framework 5.x

##Propósito
El objeto de este documento de especificación es definir de la manera más clara y precisa, todas las funcionalidades y restricciones de un pequeño “Sistema de Atención/Soporte en Línea para un Restaurante de Comidas Rápidas” **(SALCOR)**.

##Descripción
El Sistema cuenta con un módulo de clientes particular para validar/reconocer la identidad del cliente al usar el sistema, llevar control del pedido o llevar estadísticas de fidelización de usuarios. La información de cada usuario debe coincidir con la definición de la siguiente tabla:

```
Tabla: customer
idcustomer int not null autoincrement PK,
name varchar(150),
lastname varchar(150),
docid varchar(20) not null,
pin char(4) not null,
email varchar(180)
```
Cada cliente se registra a sí mismo, sin embargo, debe existir algún mecanismo que verifique la existencia previa del cliente en el sistema.
En cuanto a los usuarios del sistema como tal, deben seguir la siguiente estructura de información:
```
Tabla: customer
idcustomer int not null autoincrement PK,
name varchar(150) not null,
lastname varchar(150) not null,
docid varchar(20) not null,
username varchar(20) not null,
password varchar(80) not null,
pin char(4) not null,
email varchar(180) not null,
photo text,
profile varchar(15) not null
```
El campo photo de tipo text se debe usar para guardar la fotografía del empleado codificada en formato base64.
Cada usuario puede representar a un “administrador general” y solo debe existir uno en el sistema. Esto debe ser verificado. O también puede representar a un “mesero” o un “cocinero” en el sistema. Los usuarios se pueden registrar ellos mismos, lo cual sería como una solicitud que el administrador general debe aprobar. Se debe tener un mecanismo de verificación de usuario real tal como el correo electrónico o captcha para evitar suplantaciones o bots de internet.
El administrador general es el responsable por la gestión (consultar, crear, modificar o eliminar) de los módulos de usuarios y productos (consumibles, comidas rápidas, combos, promociones, etc.).

**Figura 1. Productos del restaurante**
Los usuarios deben disponer la opción de recuperar contraseña o cambiar contraseña. El uso del pin de usuario es para registrar o notificar del avance de las actividades que se van llevando a cabo durante el flujo normal de procesos en el restaurante.

**Figura 2. Estructura sugerida de un pedido.**
Como usuario “mesero”, al ingresar, su interfaz principal es el menú de productos a ofrecer. El dispositivo usado es una Tablet que se entrega al cliente para que realice su pedido. Cada pedido se comporta como un carrito de compras que va acumulando los productos seleccionados y le presenta la cuenta al final. El pedido quedara registrado como atendido por el mesero que está registrado en la Tablet. El cliente “firma” la orden con su pin. Si no tiene pin le brinda la opción de registrarse únicamente con los datos obligatorios según la base de datos.
La página de inicio del sistema corresponde al formulario de login y password.
Para el usuario “cocinero” se realiza el mismo procedimiento de ingreso, pero su interfaz principal de ingreso será semejante a un sistema de monitorización en el que podrá ver los pedidos que se van realizando y podrá seleccionar cual atender, dando prioridad a la fecha y hora del pedido. Es decir, el sistema le dejara atender según el orden de llegada del pedido. El cocinero acepta un pedido usando su pin. El sistema debe registrar quien atendió cada uno de los pedidos en las dos fases: realización del pedido y atención del pedido.
Debe existir una página de error o mensajes que se usará para mostrar mensajes del sistema al usuario. La página de información personal se usa para ver los detalles de la información del usuario. Se muestran todos los detalles incluyendo la fotografía si existiese. En la página de menú se pueden ver todos los detalles de cada uno de los productos que el cliente elija. Las otras páginas corresponden a las interfaces para las operaciones CRUD sobre la base de datos para administrar la información de cada entidad de datos. Se pueden definir más interfaces si se desea, pero no pueden ser menos de las que se muestran en la figura 3.

Todas las interfaces deben ser implementadas usando HTML5, CSS3 y Javascript. Si se desea se puede usar algún framework Ajax, para mejorar la presentación de las interfaces, tal como jQuery, AngularJS, ExtJS, Mootools, DojoToolkit, prototype, etc.

En las páginas que muestren listados se deben visualizar solo dos columnas de datos básicos. Esto para los reportes. Para productos el id del producto y el nombre del producto, etc.

Para ver los detalles, se usará Ajax y el evento del mouse onmouseover para desplegar al lado o encima de la tabla, todos los detalles del producto, usuario o pedido. Cuidado con la forma en que se presenta esta ventana emergente y la posición de la misma en pantalla.

Sugerencia: Este requisito se puede implementar fácilmente usando un framework Ajax como jQuery que se puede adicionar al framework Laravel.

La información del pedido (order) debe corresponder, al menos, con la siguiente definición de tabla:
```
Tabla: order
idorder int autoincrement not null PK,
orderdate datetime not null,
pinwaiter int not null,
pinchef int,
attenddate datetime, (not null)
payvalue numeric(6,2),
status int not null
```
La información de un producto debe corresponder, al menos, con la siguiente definición de tabla:
```
Tabla: product
idproduct int autoincrement not null PK,
name varchar(250) not null,
description text,
price numeric(5,2) not null,
registrationdate date not null, //Fecha en que se registra el prod.
updatedate datetime not null, //Fecha en que se actualiza el prod.
```
La información de un producto del pedido debe corresponder, al menos, con la siguiente definición de tabla:
```
Tabla: orderproduct
idorderproduct int autoincrement not null PK,
idproduct int not null,
idorder int not null FK
```
Toda la lógica de la aplicación debe ser implementada principalmente usando el framework Laravel o javascript (jQuery) para el caso de la interactividad Ajax.


##Algunos criterios a evaluar
Todas las interfaces gráficas deben ser validadas con la W3C en formato HTML5. Cada error representa una décima menos en la calificación final.
En correspondencia con la base de datos, los formularios deben validar los datos antes de enviar, esto incluye tamaño de los campos (longitud de las cadenas), valores obligatorios (not null) u opcionales, tipos de datos (texto, numérico, email, etc.).
Seguridad en la aplicación. Las interfaces y/o procesos solo deben ser accedidas después de la validación del usuario. En lo posible usar control de acceso basado en roles.
Responder las preguntas del profesor durante la sustentación. Pueden ser preguntas de grupo o individual.
##Cumplimiento de requisitos.

Compartir la solución, a través del servicio Google Drive, a través de la cuenta de correo electrónico institucional a javhur@unicauca.edu.co
