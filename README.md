# tienda_app
Desarrollo del proyecto de tienda para la clase de Ingenieria de software 1

## Interfaz de Usuario
La interfaz de usuario se desarrolla en docker y en un entorno flutter.

Al ingresar a la interfaz lo primero es seleccionar el modo de ingreso dependiendo del usuario se podrán realizar o no diferentes acciones, para eso se muestra la siguiente interfaz:

![image](https://github.com/IvanDanielVillegas/EEG_Drone_Control/blob/master/login.jpeg)

### Consultar y agregar pedido 

Cuando se elige la ópcion Cliente, se nos permite agregar y consultar pedidos haciendo uso del API MID, para esto se listan los productos con la ópción de agregar al carrito de compras. La información sobre el servició se encuentra en el siguiente enlace: https://github.com/IvanDanielVillegas/TiendaLa40_Orquestador/tree/master/carrito

![image](https://github.com/IvanDanielVillegas/EEG_Drone_Control/blob/master/ordenes.jpeg)

En el carrito se muestra la opción de ordenar, la cual agrega un pedido. 

![image](https://github.com/IvanDanielVillegas/EEG_Drone_Control/blob/master/carrito-full.jpeg)

La opción de la consulta de pedidos genera la lista que puede ser consultada por el cliente o por el administrador.

![image](https://github.com/IvanDanielVillegas/EEG_Drone_Control/blob/master/ordenes-list-2.jpeg) ![image](https://github.com/IvanDanielVillegas/EEG_Drone_Control/blob/master/ordenes-list.jpeg)


### Consultar y agregar productos

La consulta de los productos se realiza con el consumo de microservicios, los cuales muestran la lista de productos y en caso de que el administrador lo desee se despliega la ópción de agregar alguno. El cliente tambien puede consultar los productos, pero no tiene la opción de agregar o editar alguno de estos. La información sobre el servició se encuentra en el siguiente enlace: https://github.com/IvanDanielVillegas/TiendaLa40_Orquestador/tree/master/productos

![image](https://github.com/IvanDanielVillegas/EEG_Drone_Control/blob/master/inventario-ordenes.jpeg)![image](https://github.com/IvanDanielVillegas/EEG_Drone_Control/blob/master/inventario.jpeg)

Para más información se puede consultar el siguiente enlace:
https://github.com/IvanDanielVillegas/TiendaLa40_Orquestador
