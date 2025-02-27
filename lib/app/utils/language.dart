import 'dart:ui';

enum Language {
  english(Locale('en', 'US'), 'English'),
  russia(Locale('ru', 'RU'), 'Russia'),
  german(Locale('de', 'DE'), 'German'),
  japan(Locale('ja', 'JP'), 'Japan'),
  korea(Locale('ko', 'KR'), 'Korea'),
  indonesia(Locale('id', 'ID'), 'Indonesia'),
  arabic(Locale('ar', 'SA'), 'Saudi Arabia');

  const Language(this.value, this.text);

  final Locale value;
  final String text;
}
