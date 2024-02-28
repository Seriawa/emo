import 'package:emo/app/models/emoji.dart';
import 'package:get/get.dart';
import 'package:emo/app/servises/user_srvice.dart';
import 'package:emo/app/data/emoji_data.dart';

class HomeController extends GetxController {
  var _userService = Get.find<UserService>();

  var activeIndex = 0.obs;
  var emojiList = EmojiData.emojiList.obs;


  Emoji get getActiveEmoji {
    return Emoji(data:emojiList[activeIndex.value]);
  }

  changeActiveIndex() {
    if(activeIndex.value + 1 < emojiList.length) {
      activeIndex.value++;
    } else {
      activeIndex.value = 0;
    }
    _userService.saveData(getActiveEmoji);
    print(activeIndex.value);
  }

  initializeIndex() {
    var storedData = _userService.userData;
    print("INIT $storedData");
    activeIndex.value = emojiList.indexOf(storedData?.data);
  }

  @override
  void onInit() {
    super.onInit();
    initializeIndex();
  }
}