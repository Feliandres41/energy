import 'package:energy/screens/screens.dart';
import 'package:flutter/widgets.dart';

class Routers {
  static final rutaInicial = "/home";
  static Map<String,WidgetBuilder> manejoRutas =
  {
    '/':(context)=>LoginScreen(),
    '/home':(context)=>HomeScreen(),
    '/day':(context)=>MyDayScreen()

  };
}