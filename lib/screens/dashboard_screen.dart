import 'package:energy/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('___'),
      ),
      drawer: DrawerWidget(),
      //color drawer
      drawerScrimColor: Colors.black.withOpacity(0.5),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

