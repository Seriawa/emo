import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:emo/app/models/emoji.dart';

class Storage extends GetxService {
  late GetStorage box;

  Future <Storage> init() async{
    await GetStorage.init(StorageKeysHelper.containerName.name);
    box = GetStorage(StorageKeysHelper.containerName.name);
    return this;
  } 

  Future <void> writeSettings(Emoji data) async{
    var json = data.toJson();
    // ignore: unused_local_variable
    var string = jsonEncode(json);
    await box.write(StorageKeysHelper.emojiStorageKey.name, data);
  }

  Emoji? readSettings() {
    var string = box.read(StorageKeysHelper.emojiStorageKey.name);
    if(string == null) return null;
    var json = jsonDecode(string);
    var data = Emoji.fromJson(json);
    return data;
  }
}

enum StorageKeysHelper{
  containerName,
  emojiStorageKey,
}