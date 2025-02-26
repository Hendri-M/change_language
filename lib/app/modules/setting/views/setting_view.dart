import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_change_language/app/utils/language_extension.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: SafeArea(
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 6 / 4,
            ),
            children: controller.lang.asMap().entries.map((entry) {
              var item = entry.value;
              return Ink(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                      color: item['id'] == controller.selectedLang.value
                          ? Colors.green
                          : Colors.blue,
                      width:
                          item['id'] == controller.selectedLang.value ? 2 : 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    controller.changeLanguage(item['text'] as String);
                  },
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Colors.blue[300],
                  child: Stack(alignment: Alignment.center, children: [
                    item['id'] == controller.selectedLang.value
                        ? const Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10, top: 5),
                              child: Icon(
                                Icons.check_circle_sharp,
                                color: Colors.green,
                                size: 25,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    Column(
                      children: [
                        Image(
                          image: item['image'] as ImageProvider,
                          width: 80,
                          height: 80,
                        ),
                        Text(item['text'] as String)
                      ],
                    ),
                  ]),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
