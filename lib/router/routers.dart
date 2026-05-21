import 'package:energy/screens/screens.dart';
import 'package:flutter/widgets.dart';

class Routers {
  static final rutaInicial = "/";
  static Map<String,WidgetBuilder> manejoRutas =
  {
    '/':(context)=>LoginScreen(),
    '/dashboard':(context)=>DashboardScreen(),
    '/home':(context)=>HomeScreen(),

  };
}