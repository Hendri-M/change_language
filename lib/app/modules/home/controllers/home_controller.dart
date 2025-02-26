import 'package:get/get.dart';
import 'package:getx_change_language/app/utils/language_controller.dart';
import 'package:getx_change_language/app/utils/shared_pref.dart';

class HomeController extends GetxController {
  final language = Get.find<LanguageController>();

  dynamic getFlag() {
    final idLang = SharedPref().getString('langId');
    final image = language.langList.firstWhere((it) => it['id'] == idLang);

    return image['image'];
  }

  @override
  void onInit() {
    super.onInit();
    getFlag();
  }
}
