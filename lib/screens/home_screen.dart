import 'package:energy/providers/provider_api.dart';
import 'package:energy/widgets/drawer_widget.dart';
import 'package:energy/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    bool showC = false;
    final size = MediaQuery.of(context).size;
    final widthCard=size.width*0.29;
    final heightCard = size.height*0.3;
    return Scaffold(
      appBar: ProfileWidget(),
      
      drawer: DrawerWidget(),
      //color drawer
      drawerScrimColor: Colors.black.withOpacity(0.5),
      resizeToAvoidBottomInset: true,
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: Consumer<ProviderApi>(builder: (context, value, child) => 
        SingleChildScrollView(
          child: Column(
          
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [          
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
        
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: size.width*0.97,
                    height: size.height*0.15,
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
                              Text('Riohacha | Gestión energetica asistida',style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
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
                          child: Container(
                            width: size.width*0.9,
                            child: Text('Monitorea consumo, produccion solar, alertas te recomendaciones con una expericnencia mas clara.',
                            style: TextStyle(
                              fontSize: 17,
                            ),textAlign: TextAlign.justify,),
                          ),
                        )
                      ],
                    ),
                    // child: ,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 1,
              children: [
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  // color: Colors.transparent,
                  child: Container(
                    width: widthCard,
                    height: heightCard,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(103, 6, 48, 82),
                                  borderRadius: BorderRadius.circular(20)
                                ),child: Icon(Icons.dashboard,size: 50,),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Dashboard',
                              style: TextStyle(fontSize: 17),),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
        
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            width: size.width*0.22,
                            child: Text('Consulta KPIs, tendencia y comparativas del negocio',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 13),),
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
                    width: widthCard,
                    height: heightCard,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(103, 6, 48, 82),
                                  borderRadius: BorderRadius.circular(20)
                                ),child: Icon(Icons.recommend,size: 50,),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Recomendaciones',
                              style: TextStyle(fontSize: 17),),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
        
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            width: size.width*0.22,
                            child: Text('Prioriza acciones concretas de ahorro y operacion',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 13),),
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
                    width: widthCard,
                    height: heightCard,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(103, 6, 48, 82),
                                  borderRadius: BorderRadius.circular(20)
                                ),child: Icon(Icons.report,size: 50,),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Reportes',
                              style: TextStyle(fontSize: 17),),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
        
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            width: size.width*0.22,
                            child: Text('Descarga informes listos para seguimiento interno',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 13),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Container(
                width: size.width*0.9,
                height: size.height*0.05,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(104, 25, 98, 194),
                  borderRadius: BorderRadius.circular(10)
                ),child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text('Usa el menú lateral para navegar. Cada módulo inicia en vista compacta para una experiencia más ligera.',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      
                      style: TextStyle(fontSize: 13),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
                        height: 20,
                      ),
                      Container(
                        width: size.width*0.4,
                        height: size.height*0.02,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 167, 121, 53),
                          borderRadius: BorderRadius.circular(10)
                        ),child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Modo alterno activo: Reglas (fallback)',style: TextStyle(fontSize: 15),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        
        
        
        
        
        
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
                          ),child: Icon(Icons.analytics,size: 35,),
                          ),
                          Text('Empresas accesibles',style: TextStyle(
                            fontSize: 20
                          ),)
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: size.width*0.4,
                        height: 40,
                        decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 167, 121, 53),
                          borderRadius: BorderRadius.circular(10)
                        ),child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Total'),
                            Text('1',style: TextStyle(fontSize: 10),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
          ),
        ),
        ),
      )
    );
  }
}

