import 'package:emo/app/servises/storage.dart';
import 'package:emo/app/servises/user_srvice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future <void> initServices() async{

  await Get.putAsync(() => Storage().init());
  await Get.putAsync(() => UserService().init());
}