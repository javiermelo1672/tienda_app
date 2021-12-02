import 'dart:convert';

List<ProductData> productDataFromJson(String str) => List<ProductData>.from(
    json.decode(str).map((x) => ProductData.fromJson(x)));

String productDataToJson(List<ProductData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductData {
  ProductData({
    this.cantidad,
    this.descripcion,
    this.id,
    this.nombre,
    this.valor,
  });

  int cantidad;
  String descripcion;
  int id;
  String nombre;
  int valor;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        cantidad: json["cantidad"],
        descripcion: json["descripcion"],
        id: json["id"],
        nombre: json["nombre"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "descripcion": descripcion,
        "id": id,
        "nombre": nombre,
        "valor": valor,
      };
}
