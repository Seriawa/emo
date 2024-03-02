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
        backgroundColor: Color.fromARGB(255, 27, 38, 44),
      ),
      
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 15, 76, 117), Color.fromARGB(255, 50, 130, 184), Color.fromARGB(255, 187, 225, 250)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
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