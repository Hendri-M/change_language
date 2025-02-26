import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_change_language/app/utils/language.dart';
import 'package:getx_change_language/app/utils/shared_pref.dart';
import 'package:getx_change_language/gen/assets.gen.dart';

class LanguageController extends GetxController {
  final langList = [
    {
      "id": "english",
      "text": "English",
      "image": AssetImage(Assets.unitedKingdom.path)
    },
    {"id": "russia", "text": "Russia", "image": AssetImage(Assets.rusia.path)},
    {
      "id": "korea",
      "text": "Korea",
      "image": AssetImage(Assets.southKorea.path)
    },
    {"id": "japan", "text": "Japan", "image": AssetImage(Assets.japan.path)},
    {"id": "german", "text": "German", "image": AssetImage(Assets.german.path)},
    {
      "id": "indonesia",
      "text": "Indonesia",
      "image": AssetImage(Assets.flag.path)
    },
  ];

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
