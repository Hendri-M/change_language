# GetX Change Language App

Simple Change Language App using GetX State Management, Localization (l10n), Shared Preferences.
Before running this application, first run this command ``flutter gen-l10n`` to generate language translations from files in the l10n folder.


```
Available Language on this Apps: 
1. Indonesia
2. English
3. Japanese
4. Korean
5. Germany
6. Russian

Flutter Version 3.24.4 Dart Version 3.5.4
```

![](https://github.com/Hendri-M/gifs-only/blob/main/language.gif)


## How to Add More Language
* Create new file in l10n folder
   ```
   lib
   ├───...
   │
   └───l10n
        ├───app_de.arb
        ├───app_en.arb
        ├───app_es.arb
        ├───...
        └───yours_app_file.arb

   ```
  you can copy the values from the previous ```.arb``` file and change the language inside, then run ```flutter gen-l10n``` to generate file ```yours_app_file.arb```.
* Edit file ```language.dart```
  ```dart
  enum Languange{
    english(Locale('en', 'US'), 'English'),
    indonesia(Locale('id', 'ID'), 'Indonesia'),
    ...,
    // <<--- Add Here --->>
    yours_app_file(Locale('languange_id', 'country_id'), 'Country Name')
  }
  ...
  ```
* Add an image, you can add the image in the asset folder
  ```
  <root>
   ├───...
   │
   ├───assets
        ├───image.png
        ├───...
        └───yours_image
  ```
  then run ```dart run build_runner build --delete-conflicting-outputs``` or ```flutter pub run build_runner build --delete-conflicting-outputs``` for generate AssetsGen when adding new images.
* Add a language object, this object is used to get an image of each language.
  ```
  lib
   ├───app
   │     ├───data
   │     ├───modules
   │     ├───routes
   │     └───utils
   │           ├───...
   │           ├───language_list.dart
   │           └───...
   │
   └───...
  ```
  
  ```dart
  import 'package:flutter/widgets.dart';

    import '../../gen/assets.gen.dart';

    List<Map<String, Object>> languages = [
    {"id": "english", "text": "English", "image": AssetImage(Assets.unitedKingdom.path)},
    {"id": "indonesia", "text": "Indonesia", "image": AssetImage(Assets.indonesia.path)},
    ...
    // <<- Add Here ->>
    {"id": "your_lang_id", "text": "your_lang_name", "image": 'call_your_AssetImage_path'},
    ];

  ```
  ***id and text must be same values***


#### Okay, that's all, run the application

#### Thank you, don't forget the star :star:	 :grin:	