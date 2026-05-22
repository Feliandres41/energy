import 'package:energy/screens/screens.dart';
import 'package:flutter/widgets.dart';

class Routers {
  static final rutaInicial = "/dashboard";
  static Map<String,WidgetBuilder> manejoRutas =
  {
    '/':(context)=>LoginScreen(),
    '/home':(context)=>HomeScreen(),
    '/day':(context)=>MyDayScreen(),
    /*Sin terminar (abajo)*/
    '/dashboard':(context)=>DashboardScreen(),
    '/recommend':(context)=>RecommendScreen(),
    '/alerts':(context)=>AlertsScreen(),
    '/consumer':(context)=>ConsumerScreen(),
    
  };
}