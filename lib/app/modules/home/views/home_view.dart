import 'package:emo/app/data/emoji_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тыкай'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          EmojiData.emojiList [0],
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
