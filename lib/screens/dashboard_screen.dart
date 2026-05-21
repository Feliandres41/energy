import 'package:energy/providers/provider_api.dart';
import 'package:energy/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((_) {

  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text('Bienvenido'),
  //           content: const Text(
  //             'Bienvenido al sistema de gestión energética.',
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );

  //   });
  // }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.person),
          Text(' | '),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            
            child: Text(Provider.of<ProviderApi>(context).correo),
          )
        ],
      ),
      drawer: DrawerWidget(),
      //color drawer
      drawerScrimColor: Colors.black.withOpacity(0.5),
      body: Consumer<ProviderApi>(builder: (context, value, child) => 
      Column(
        
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(

                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: size.width*0.9,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 7, 140, 163),
                      Color.fromARGB(255, 26, 95, 141),
                    ],
                    ),
                  ),child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,width: 1),
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Icon(Icons.sunny,size: 30,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Rioacha | Gestión energetica asistida',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1,left: 20),
                        child: Text('Agente Solar Inteligente',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2,left: 20),
                        child: Text('Monitorea consumo, produccion solar, alertas te recomendaciones con una expericnencia mas clara.',
                        style: TextStyle(
                          fontSize: 17,
                        ),textAlign: TextAlign.justify,),
                      )
                    ],
                  ),
                  // child: ,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Color.fromARGB(255, 3, 56, 124),
            child: Container(
              width: size.width*0.9,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Bienvenido, Gerente Hotel Solar",style: TextStyle(
                      fontSize: 22
                    ),),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                // color: Colors.transparent,
                child: Container(
                  width: 270,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dashboard',
                            style: TextStyle(fontSize: 20),),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(103, 6, 48, 82),
                                borderRadius: BorderRadius.circular(20)
                              ),child: Icon(Icons.dashboard),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 230,
                          child: Text('Consulta KPIs, tendencia y comparativas del negocio',
                          textAlign: TextAlign.justify,),
                        ),
                      )
                    ],
                  ),
                ),
              ),



              Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                // color: Colors.transparent,
                child: Container(
                  width: 270,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Recomiendaciones',
                            style: TextStyle(fontSize: 20),),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(103, 6, 48, 82),
                                borderRadius: BorderRadius.circular(20)
                              ),child: Icon(Icons.notifications),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 230,
                          child: Text('Consulta KPIs, tendencia y comparativas del negocio',
                          textAlign: TextAlign.justify,),
                        ),
                      )
                    ],
                  ),
                ),
              ),



              Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                // color: Colors.transparent,
                child: Container(
                  width: 270,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Reportes',
                            style: TextStyle(fontSize: 20),),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(103, 6, 48, 82),
                                borderRadius: BorderRadius.circular(20)
                              ),child: Icon(Icons.edit_document),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 230,
                          child: Text('Consulta KPIs, tendencia y comparativas del negocio',
                          textAlign: TextAlign.justify,),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              width: size.width*0.9,
              height: 45,
              // color: Colors.red,
              decoration: BoxDecoration(
                color: const Color.fromARGB(104, 25, 98, 194),
                borderRadius: BorderRadius.circular(10)
              ),child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Usa el menu lateral para navegar. Cada modulo inicia en vista compacta y permite abrir detalles tecnicps cuando los necesites',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14),),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(104, 25, 98, 194),
                          // border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                          borderRadius: BorderRadius.circular(30)
                        ),child: Icon(Icons.lightbulb,size: 35,),
                        ),
                        Text('Motor de recomendaciones',style: TextStyle(
                          fontSize: 20
                        ),)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width*0.4,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 186, 106),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      )
    );
  }
}

