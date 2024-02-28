import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тычки мычки перемычки'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 202, 106),
      ),
      
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 92, 0, 213),
        ),
        child: Center(
          child: GestureDetector(
          onTap: () => controller.changeActiveIndex(),
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Obx(
              () => Text(
                controller.getActiveEmoji.data,
                style: const TextStyle(fontSize: 80),
              ),
            ),
          ),
        ),
      ),
       ),);
  }
}