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

        await consumoProduccion('1');

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
  Future<bool> consumoProduccion(String? dia) async {
    if (id == 0 || token.isEmpty) {
      print('consumoProduccion: no hay id o token válido');
      return false;
    }

    final days = dia == null || dia.isEmpty ? null : dia.split('.').first;

    try {
      final uri = days == null
          ? Uri.parse("http://10.4.59.112:8001/api/v1/consumo/empresa/$id")
          : Uri.parse("http://10.4.59.112:8001/api/v1/consumo/empresa/$id?days=$days");
      print('GET $uri');

      final respuesta = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print('status: ${respuesta.statusCode}');
      print('body: ${respuesta.body}');

      if (respuesta.statusCode == 200) {
        final decoded = jsonDecode(respuesta.body);

        if (decoded is List) {
          consumoEmpresa = decoded.cast<Map<String, dynamic>>();
          print('consumoEmpresa items: ${consumoEmpresa.length}');
          if (consumoEmpresa.isNotEmpty) {
            print(consumoEmpresa[0]['fecha']);
          }
        } else if (decoded is Map<String, dynamic>) {
          consumoEmpresa = [decoded];
          print(decoded['fecha']);
        } else {
          print('consumoProduccion: respuesta inesperada');
        }

        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
  
}