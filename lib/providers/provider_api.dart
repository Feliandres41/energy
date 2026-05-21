import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
class ProviderApi extends ChangeNotifier{
  ProviderApi(){
    Login('','');
  }
  bool logueado = false;
  /* Datos del usuario*/
  String token = "";
  String rol = '';
  String correo = "";
  /* */
  Future<bool> Login(String email,String password)async{
    // sleep(Duration(seconds: 5));
    try{  final link = Uri.parse("http://10.4.59.112:8001/api/v1/auth/login");
      final respuesta = await http.post(
        link,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          // "email": "admin@agentesolar.com",
          // "password": "admin123"
          "email": email,
          "password":password
        }),
      );
      if(respuesta.statusCode==200){
        final data = jsonDecode(respuesta.body);
        /*Datos del usuario */
        token = data['access_token'];//token
        
        Map<String,dynamic> decodedToken = JwtDecoder.decode(token);//decodificar
        correo = decodedToken["email"];
        rol = decodedToken['role'];
        /* */
        print('Logueado');
        print('__\n${decodedToken}');
        logueado=true;
        return true;
      }else{
        print('Usuario incorrecto');
        return false;
      }
    }catch(e){
      print('Error de conexión');
      return false;
    }
  }
  //logout
  
}