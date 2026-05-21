import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ProviderApi extends ChangeNotifier{
  ProviderApi(){
    Login('','');
  }

  Future<bool> Login(String email,String password)async{
    try{  final link = Uri.parse("http://localhost:8001/api/v1/auth/login");
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
        print('Logueado');
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