import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
class ProviderApi extends ChangeNotifier{
  ProviderApi();

  /* Datos del usuario*/
  String token = "";
  String rol = '';
  String correo = "";
  int id = 0;

  /* Datos de consumo */
  List<Map<String, dynamic>> consumoEmpresa = [];
  List<Map<String, dynamic>> radiacionSolarData = [];

  Map<String, String> get _headers => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

  Future<List<Map<String, dynamic>>> _fetchList(String uri) async {
    final respuesta = await http.get(Uri.parse(uri), headers: _headers);
    if (respuesta.statusCode != 200) return [];

    final decoded = jsonDecode(respuesta.body);
    if (decoded is List) return decoded.cast<Map<String, dynamic>>();
    if (decoded is Map<String, dynamic>) return [decoded];
    return [];
  }

  /* Login */
  Future<bool> login(String email, String password) async {
    try {
      final link = Uri.parse("http://10.4.59.112:8001/api/v1/auth/login");

      final respuesta = await http.post(
        link,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password
        }),
      );

      if (respuesta.statusCode == 200) {
        final data = jsonDecode(respuesta.body);

        token = data['access_token'];

        final decoded = JwtDecoder.decode(token);

        correo = decoded["email"];
        rol = decoded["role"];
        id = decoded['empresa_id'];
        print("_____________________\n $decoded");


        notifyListeners();

        await Future.wait([
          consumoProduccion('30'),
          radiacionSolar('30'),
        ]);

        return true;
      } else {
        print('Usuario incorrecto');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  } 
  /*Consumo empresa */
  Future<bool> consumoProduccion(String dias) async {
    if (id == 0 || token.isEmpty) return false;

    consumoEmpresa = await _fetchList(
      "http://10.4.59.112:8001/api/v1/consumo/empresa/$id?days=$dias",
    );

    notifyListeners();
    return consumoEmpresa.isNotEmpty;
  }
  //Radiación solar historica http://10.4.59.112:8001/api/v1/solar/radiacion?days=2

  Future<bool> radiacionSolar(String dias) async {
    int dato = int.parse(dias);
    dato = dato + 1;
    if (token.isEmpty) return false;

    radiacionSolarData = await _fetchList(
      "http://10.4.59.112:8001/api/v1/solar/radiacion?days=$dato",
    );

    notifyListeners();
    return radiacionSolarData.isNotEmpty;
  }
  
}