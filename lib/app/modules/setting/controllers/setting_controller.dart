import 'package:get/get.dart';
import 'package:getx_change_language/app/utils/language.dart';
import 'package:getx_change_language/app/utils/language_controller.dart';

class SettingController extends GetxController {
  final language = Get.put(LanguageController());

  var lang = [<String, Object>{}].obs;
  var selectedLang = ''.obs;

  SettingController() {
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
    getSelectedLang();
  }
}
