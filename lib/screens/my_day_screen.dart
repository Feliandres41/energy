import 'package:energy/widgets/profile_widget.dart';
import 'package:energy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyDayScreen extends StatelessWidget{
  const MyDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final radiacion = 5.6;
    final size  = MediaQuery.of(context).size;
    final widthCard =size.width*0.47;
    final heightCard = size.height*0.18;
    int probabilidad = 5;
    return Scaffold(
      appBar: ProfileWidget(),
      drawer: DrawerWidget(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: size.width*0.97,
                  height: size.height*0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(218, 255, 217, 0),
                      Color.fromARGB(182, 255, 193, 7),
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
                              child: Icon(Icons.sunny,size: 40,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Hotel Solar Riohacha | Gestión energetica asistida',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1,left: 13),
                        child: Text('Día con avisos importantes',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2,left: 15),
                        child: Container(
                          width: size.width*0.9,
                          child: Text('Hola Hotel Solar Riohacha. Día con avisos importantes. La radiación de hoy (≈$radiacion kWh/m²) cubrirá una parte importante de tu consumo. Carga tu archivo de consumo para ver el análisis. Probabilidad estimada 45%. Carga baterías y prepara plan de contingencia. Acción sugerida: Reduce cargas no críticas en la noche.',
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
              Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Container(
                  height: size.height*0.09,
                  width: size.width*0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(103, 6, 48, 82),
                              border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Icon(Icons.notes,size: 40,),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Resumen clave',style: TextStyle(
                              fontSize: 20
                            ),),
                            Text('Lectura compacta del estado actual',style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                //fila 1 columna 1
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: const Color.fromARGB(255, 1, 43, 78)),
                      color: Color.fromARGB(103, 6, 48, 82),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: widthCard,
                    height: heightCard,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                 onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color.fromARGB(170, 1, 43, 78),
                                    content: Text('Aprovecha la franja 11 AM - 1 PM',style: TextStyle(color: Colors.white),),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                },
                                child: Icon(Icons.wb_sunny,size: 50,color: Colors.green,)
                              ),
                            ],
                          ),
                        ),
                        Text("Buen dia solar",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: size.width*0.37,
                            child: Text(
                              "La radiación de hoy (≈$radiacion kWh/m²) cubrirá una parte importante de tu consumo.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                                
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),


                //fila 1 columna 2
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: const Color.fromARGB(255, 1, 43, 78)),
                      color: Color.fromARGB(103, 6, 48, 82),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: widthCard,
                    height: heightCard,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.solar_power,size: 40,color: Colors.yellow,),
                            ],
                          ),
                        ),
                        Text("Sin paneles activos",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: size.width*0.37,
                            child: Text(
                              "No hay producción solar registrada. Si tienes paneles, verifica el inversor.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300  
                                
                              ),
                              textAlign: TextAlign.justify,
                            ),
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



            //siguiente fila
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                //fila 1 columna 1
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: const Color.fromARGB(255, 1, 43, 78)),
                      color: Color.fromARGB(103, 6, 48, 82),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: widthCard,
                    height: heightCard,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.electrical_services,size: 50,color: Colors.red,),
                            ],
                          ),
                        ),
                        Text("Riesgo alto de apagón",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: size.width*0.37,
                            child: Text(
                              "Probabilidad estimada ${probabilidad}%. Carga baterías y prepara plan de contingencia.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                                
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),


                //fila 1 columna 2
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: const Color.fromARGB(255, 1, 43, 78)),
                      color: Color.fromARGB(103, 6, 48, 82),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: widthCard,
                    height: heightCard,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.air,size: 50,color: Colors.green,),
                            ],
                          ),
                        ),
                        Text("Aire limpio",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: size.width*0.37,
                            child: Text(
                              "Buena calidad del aire (2 µg/m³). Paneles operando con eficiencia plena.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                                
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //acciones rapidas
            Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Container(
                  height: size.height*0.09,
                  width: size.width*0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(103, 6, 48, 82),
                              border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Icon(Icons.flash_on,size: 40,),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Acciones rapidas',style: TextStyle(
                              fontSize: 20
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //ver recomendaciones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/recommend');
                    },
                    child: Card(
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      child: Container(
                        width: widthCard*0.5,
                        height: heightCard*0.2,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text('Ver recomendaciones'),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/alerts');
                    },
                    child: Card(
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      child: Container(
                        width: widthCard*0.5,
                        height: heightCard*0.2,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text('Ver alertas'),
                        ),
                      ),
                    ),
                  ),
                  //consumidor
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/consumer');
                    },
                    child: Card(
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      child: Container(
                        width: widthCard*0.5,
                        height: heightCard*0.2,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text('Abrir consumo'),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/')
                    },
                    child: Card(
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      child: Container(
                        width: widthCard*0.5,
                        height: heightCard*0.2,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2,color: const Color.fromARGB(34, 64, 195, 255)),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text('Detalles tecnicos'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

          ],
        ),
      ),
    );
  }
}