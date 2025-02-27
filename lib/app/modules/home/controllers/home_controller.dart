import 'package:get/get.dart';
import 'package:getx_change_language/app/utils/language_controller.dart';
import 'package:getx_change_language/app/utils/shared_pref.dart';

class HomeController extends GetxController {
  final language = Get.find<LanguageController>();

  var flagImage = <String, Object>{}.obs;

  void getFlag() {
    final idLang = SharedPref().getString('langId') ?? 'english';
    final image = language.langList.firstWhere((it) => it['id'] == idLang);

    flagImage.value = image;
    // return image['image'];
  }

  void clearPref() {
    language.changeToDefault();
  }

  @override
  void onInit() {
    super.onInit();
    getFlag();
  }
}
