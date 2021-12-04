import 'dart:convert';

PedidosData pedidosDataFromJson(String str) =>
    PedidosData.fromJson(json.decode(str));

String pedidosDataToJson(PedidosData data) => json.encode(data.toJson());

class PedidosData {
  PedidosData({
    this.pedidos,
  });

  List<Pedido> pedidos;

  factory PedidosData.fromJson(Map<String, dynamic> json) => PedidosData(
        pedidos:
            List<Pedido>.from(json["pedidos"].map((x) => Pedido.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pedidos": List<dynamic>.from(pedidos.map((x) => x.toJson())),
      };
}

class Pedido {
  Pedido({
    this.id,
    this.status,
    this.date,
    this.valorPedido,
    this.productos,
  });

  int id;
  String status;
  String date;
  int valorPedido;
  List<Producto> productos;

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        id: json["id"],
        status: json["status"],
        date: json["date"],
        valorPedido: json["valor_pedido"],
        productos: List<Producto>.from(
            json["productos"].map((x) => Producto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "date": date,
        "valor_pedido": valorPedido,
        "productos": List<dynamic>.from(productos.map((x) => x.toJson())),
      };
}

class Producto {
  Producto({
    this.idProducto,
    this.nombre,
    this.cantidad,
    this.valor,
    this.descripcion,
    this.valorTotalP,
  });

  int idProducto;
  String nombre;
  int cantidad;
  int valor;
  String descripcion;
  int valorTotalP;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        idProducto: json["id_producto"],
        nombre: json["nombre"],
        cantidad: json["cantidad"],
        valor: json["valor"],
        descripcion: json["descripcion"],
        valorTotalP: json["valor_total_p"],
      );

  Map<String, dynamic> toJson() => {
        "id_producto": idProducto,
        "nombre": nombre,
        "cantidad": cantidad,
        "valor": valor,
        "descripcion": descripcion,
        "valor_total_p": valorTotalP,
      };
}
