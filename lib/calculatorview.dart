import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_controller.dart';
import 'package:flutter/cupertino.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorController = Get.put(CalculatorController());

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Calculatordisplay(
            hint: "Enter first number",
            controller: calculatorController.display1controller,
            onChanged: (value) => calculatorController.updateDisplay1(value),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Calculatordisplay(
            hint: "Enter Second number",
            controller: calculatorController.display2controller,
            onChanged: (value) => calculatorController.updateDisplay2(value),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Obx(() => Text(
                calculatorController.z.value.toString(),
                style: const TextStyle(
                    fontSize: 76.0, fontWeight: FontWeight.bold),
              )),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: calculatorController.calculateSum,
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: calculatorController.calculateDifference,
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: calculatorController.calculateProduct,
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: calculatorController.calculateQuotient,
                child: const Icon(CupertinoIcons.divide),
              )
            ],
          ),
          FloatingActionButton.extended(
            onPressed: calculatorController.clear,
            label: const Text("Clear"),
          ),
        ],
      ),
    );
  }
}

class Calculatordisplay extends StatelessWidget {
  const Calculatordisplay({
    Key? key,
    this.hint = "Enter a number",
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  final String? hint;
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87, width: 3.5),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87, width: 13.5),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
