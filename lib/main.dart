import 'package:energy/providers/provider_api.dart';
import 'package:energy/router/routers.dart';
import 'package:energy/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ConsumerProvider());
}

class ConsumerProvider extends StatelessWidget{
  const ConsumerProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ProviderApi())
    ],child: Myapp(),);
  }
}

class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.rutaInicial,
      routes: Routers.manejoRutas,
      theme: Themes.modo,
    );

  }
}