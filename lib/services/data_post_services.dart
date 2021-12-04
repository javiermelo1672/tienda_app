import 'package:dio/dio.dart';
import 'package:tienda_app/global/global_endpoints.dart';

class DataPostService {
  Dio _dioPost = new Dio();

  Future<bool> addProducts(
      String name, String quantity, String price, String description) async {
    try {
      Map<String, dynamic> _body = {
        "producto_nombre": name,
        "producto_cantidad": int.parse(quantity),
        "producto_valor": int.parse(price),
        "producto_descripcion": description
      };
      final Response resp = await _dioPost
          .post(globalEndpoint + products + "/" + agregar, data: _body);
      print(resp);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addOrder(List<dynamic> pedido) async {
    try {
      Map<String, dynamic> _body = {"customer_id_fk": 2, "pedido": pedido};
      final Response resp =
          await _dioPost.post(globalEndpoint + guardarOrden, data: _body);
      print(resp);
      return true;
    } catch (e) {
      return false;
    }
  }
}
