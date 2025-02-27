import 'package:get/get.dart';
import 'package:getx_change_language/app/modules/home/controllers/home_controller.dart';
import 'package:getx_change_language/app/utils/language.dart';
import 'package:getx_change_language/app/utils/language_controller.dart';

class SettingController extends GetxController {
  final language = Get.find<LanguageController>();
  final home = Get.put(HomeController());

  var lang = [<String, Object>{}].obs;
  var selectedLang = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getLanguageList();
    getSelectedLang();
  }

  void getLanguageList() {
    lang.value = language.langList;
  }

  void getSelectedLang() {
    selectedLang.value = language.selectedLangId.value;
  }

  void changeLanguage(String lang) {
    const lg = Language.values;
    final vl = lg.firstWhere(
      (it) => it.text == lang,
      orElse: () => Language.english,
    );
    language.changeLanguage(vl);
    home.getFlag();
    getSelectedLang();
  }
}
