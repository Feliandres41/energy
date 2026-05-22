import 'package:energy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConsumerScreen extends StatelessWidget{
  const ConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(),
    );
  }
}