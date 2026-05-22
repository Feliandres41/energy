import 'package:energy/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class RecommendScreen extends StatelessWidget{
  const RecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(),
    );
  }
}