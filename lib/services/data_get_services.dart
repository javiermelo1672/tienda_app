import 'package:tienda_app/global/global_endpoints.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class DataGetServices {
  Dio _dioGet = new Dio();
  Future<List<dynamic>> getProducts() async {
    try {
      final Response resp = await _dioGet.get(globalEndpoint + products);
      String decodeResp = resp.data;
      List<dynamic> decodeMap = json.decode(decodeResp);

      return decodeMap;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> getOrders() async {
    try {
      final Response resp = await _dioGet.get(globalEndpoint + getOrdenes);
      String decodeResp = resp.data;
      Map<String, dynamic> decodeMap = json.decode(decodeResp);
      return decodeMap;
    } catch (e) {
      return null;
    }
  }
}
