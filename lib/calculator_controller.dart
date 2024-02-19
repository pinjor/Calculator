import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var x = 0.obs;
  var y = 0.obs;
  var z = 0.obs;

  final display1controller = TextEditingController();
  final display2controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    display1controller.text = x.value.toString();
    display2controller.text = y.value.toString();
  }

  void updateDisplay1(String value) {
    x.value = int.tryParse(value) ?? 0;
  }

  void updateDisplay2(String value) {
    y.value = int.tryParse(value) ?? 0;
  }

  void clear() {
    x.value = 0;
    y.value = 0;
    z.value = 0;
    display1controller.clear();
    display2controller.clear();
  }

  void calculateSum() {
    z.value = x.value + y.value;
  }

  void calculateDifference() {
    z.value = x.value - y.value;
  }

  void calculateProduct() {
    z.value = x.value * y.value;
  }

  void calculateQuotient() {
    if (y.value != 0) {
      z.value = (x.value / y.value).round();
    } else {
      z.value = 0;
    }
  }
}
