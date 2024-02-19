import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'calculator_controller.dart';
import 'calculatorview.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.black26,
        elevation: 0.0,
      ),
      body: const SafeArea(
        child: CalculatorView(),
      ),
    );
  }
}
