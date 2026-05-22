import 'package:energy/providers/provider_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icono.png',
                      width: 230,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Text(
                'Agente Solar Inteligente',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Dashboard Solar con IA para Ahorro Energético en Rioacha, la guajira',
              ),

              SizedBox(height: 80),

              Card(
                child: Container(
                  width: 500,
                  padding: EdgeInsets.only(top: 0),
                  child: Form(
                    child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Column(
                                children: [
                                  Text('Correo electrónico',style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70
                                  ),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  //dato a ingresar
                                  Card(
                                    color: Color.fromARGB(32, 24, 2, 2),//color de la carta
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 380,
                                      height: 60,
                                      child: TextFormField(
                                        controller: _email,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          // hintText: 'Ingrese el correo',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            gapPadding: BorderSide.strokeAlignCenter,
                                            borderSide: BorderSide(style: BorderStyle.none)
                                          ),
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  //contraseña
                                  Text('Contraseña',style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70
                                  ),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  //dato a ingresar
                                  Card(
                                    color: Color.fromARGB(32, 24, 2, 2),//color de la carta
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 380,
                                      height: 60,
                                      child: TextFormField(
                                        obscureText: true,
                                        controller: _password,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          // hintText: 'Ingrese el correo',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            gapPadding: BorderSide.strokeAlignCenter,
                                            borderSide: BorderSide(style: BorderStyle.none)
                                          ),
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
          
                                  //boton de enviar
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: TextButton(onPressed: () async{
                                      bool logueo = await Provider.of<ProviderApi>(context,listen: false).Login(_email.text,_password.text);
                                      if(logueo==true){
                                        Navigator.pushNamed(context, '/home');
                                      }
                                    }, 
                                      child: Text(
                                        'Ingresar',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    )),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
