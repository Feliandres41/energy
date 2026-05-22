import 'package:energy/providers/provider_api.dart';
import 'package:energy/widgets/widgets.dart';
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

  double dias = 1;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tarifa = 943;
    final radiacionTotal = 5.62;
    final consumoHoy = 0.0;
    final costoHoy = "0";
    final ahorroSolarHoy = '0';

    String busquedaDias = dias.round().toString();
    
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
      drawerScrimColor: const Color.fromRGBO(0, 0, 0, 0.5),
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
                      Color.fromARGB(255, 38, 158, 134),
                      Color(0xFF1C6E5D),
                    ],
                    ),
                  ),child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        // padding: const EdgeInsets.all(12.0),
                        padding: const EdgeInsets.only(top: 12,left: 12,bottom: 7),
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
                            Text('Hotel Solar Rioacha',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0,left: 13),
                        child: Text('Dashboard energetico',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2,left: 15),
                        child: Text('Tipo: hotel · Tarifa: $tarifa COP/kWh · Paneles: 15.0 kW',
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
            height: 20,
          ),
          Row(
            spacing: 30,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Radiación actual',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),),
                  Text('$radiacionTotal kWh/m2')
                ],
              ),

              Column(
                children: [
                  Text('Consumo hoy',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),),
                  Text('$consumoHoy kWh')
                ],
              ),

              Column(
                children: [
                  Text('Costo hoy',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),),
                  Text('\$ $costoHoy')
                ],
              ),

              Column(
                children: [
                    Text('Ahorro solar hoy',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),),
                  Text('\$ $ahorroSolarHoy')
                ],
              ),

            ],
          ),
          Slider(
            value: dias,
            min: 1,
            max: 60,
            divisions: 60,
            label: dias.round().toString(),
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
            onChanged: (value) async{
              setState(() {
                dias = value;
                Provider.of<ProviderApi>(context,listen: false).consumoProduccion(busquedaDias);
              });
            },
          ),
          GrapickOneWidget(data: value.consumoEmpresa),
          // ElevatedButton(onPressed: () async{
          //   Provider.of<ProviderApi>(context,listen: false).consumoProduccion(busquedaDias);
          // }, child: Text('${Provider.of<ProviderApi>(context,listen: false).token}\n$busquedaDias'))
        ]
      )
      )
    );
  }
}

