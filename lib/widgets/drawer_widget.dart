import 'package:flutter/material.dart';
class DrawerWidget extends StatefulWidget {

  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  double sizeTextoDrawer = 18;

  double sizeIconoDrawer = 36;

  // final double sizeIconoDrawer;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320,
      child: ListView(
    
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 30),
            child: Column(
              spacing: 80,
              children: [
                //home drawer
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Row(
                      spacing: 20,
                      children: [
                        Icon(Icons.home,size: sizeIconoDrawer,),
                        Text('Home',style: TextStyle(
                        fontSize: sizeTextoDrawer
                      ),),
                    ],
                  ),
                ),
                //mi dia
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/day');
                  },
                  child: Row(
                    spacing: 20,
                    children: [
                      Icon(Icons.wb_sunny,
                      size: sizeIconoDrawer,),
                      Text('Mi dia',style: TextStyle(
                        fontSize: sizeTextoDrawer
                      ))
                    ]
                  ),
                ),


                Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.analytics,
                    size: sizeIconoDrawer,),
                    Text('Dashboard',style: TextStyle(
                      fontSize: sizeTextoDrawer
                    ))
                  ]
                ),
                //consumo drawer
                Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.energy_savings_leaf,
                    size: sizeIconoDrawer,),
                    Text('Consumo',
                    style: TextStyle(
                      fontSize: sizeTextoDrawer
                    ),)
                  ],
                ),
                //dato solres drawer
                Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.sunny,
                    size: sizeIconoDrawer,),
                    Text('Datos Solares',
                    style: TextStyle(
                      fontSize: sizeTextoDrawer
                    ),)
                  ],
                ),
                //Recomendaciones IA
                Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.smart_toy,
                    size: sizeIconoDrawer,),
                    Text('Recomendaciones IA',
                    style: TextStyle(
                      fontSize: sizeTextoDrawer
                    ),)
                  ],
                ),
                //Alertas
                Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.warning,
                    size: sizeIconoDrawer,),
                    Text('Alertas',
                    style: TextStyle(
                      fontSize: sizeTextoDrawer
                    ),)
                  ],
                ),
                //predicciones drawer
                Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.insights,
                    size: sizeIconoDrawer,),
                    Text('Predicciones',
                    style: TextStyle(
                      fontSize: sizeTextoDrawer
                    ),)
                  ],
                ),
                //reportes drawer
                Row(
                  spacing: 20,
                  children: [
                    Icon(Icons.report,
                    size: sizeIconoDrawer,),
                    Text('Reportes',
                    style: TextStyle(
                      fontSize: sizeTextoDrawer
                    ),)
                  ],
                ),
                // Divider(),
                SizedBox(
                  height: 60,
                ),
                //Cerrar sesion  drawer
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Row(
                    spacing: 20,
                    children: [
                      Icon(Icons.logout,
                      size: sizeIconoDrawer,),
                      Text('Cerrar Sesión',
                      style: TextStyle(
                        fontSize: sizeTextoDrawer
                      ),)
                    ],
                  ),
                ),
              ],
            ),
          )
          
        ],
      ),
    );
  }
}