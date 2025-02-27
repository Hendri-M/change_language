import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_change_language/app/utils/language.dart';
import 'package:getx_change_language/app/utils/language_list.dart';
import 'package:getx_change_language/app/utils/shared_pref.dart';

class LanguageController extends GetxController {
  final langList = languages;

  RxString selectedLangId = ''.obs;

  Rx<Language> language = Language.english.obs;

  LanguageController() {
    selectedLangId.value = SharedPref().getString('langId') ?? 'english';
  }

  void changeLanguage(Language lang) {
    language.value = lang;
    selectedLangId.value = lang.text.toLowerCase();

    SharedPref().saveString('language',
        '${language.value.value.languageCode}_${language.value.value.countryCode}');
    SharedPref().saveString('langId', selectedLangId.value);
    Get.updateLocale(lang.value);
    update();
  }

  void changeToDefault() async {
    await SharedPref().clear();
    selectedLangId.value = 'english';

    Get.updateLocale(const Locale('en', 'US'));
    update();
  }

  Locale loadLanguage() {
    final lang = SharedPref().getString('language');

    if (lang != null && lang.toString().isNotEmpty) {
      final parts = lang.toString().split('_');
      if (parts.length >= 2 && parts[1].isNotEmpty) {
        return Locale(parts[0], parts[1]);
      }
      return Locale(parts[0]);
    }
    return const Locale('en', 'US');
  }
}
