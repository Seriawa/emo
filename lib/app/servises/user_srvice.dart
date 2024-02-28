import 'package:emo/app/models/emoji.dart';
import 'package:get/get.dart';
import 'package:emo/app/data/emoji_data.dart';
import 'package:emo/app/servises/storage.dart';

class UserService extends GetxService {
  var storageService = Get.find<Storage>();
  Emoji? userData;

  Future<UserService> init() async {
    var dataInStorage = Storage();
    // ignore: unnecessary_null_comparison
    if (dataInStorage == null) {
      userData = await getFirstAvailableEmoji();
    }
    userData = dataInStorage as Emoji?;
    return this;
  }

  Future<Emoji> getFirstAvailableEmoji() async {
    await Future.delayed(const Duration(microseconds: 500));
    return Emoji(data: EmojiData.emojiList.first);
  }

  Future<void> saveData(Emoji data) async {
    userData = data;
    await storageService.writeSettings(data);
  }
}