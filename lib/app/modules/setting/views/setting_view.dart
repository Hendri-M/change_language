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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Wrap(
                  spacing: MediaQuery.of(context).size.width / 10,
                  runSpacing: MediaQuery.of(context).size.width / 10,
                  children: controller.lang.asMap().entries.map((item) {
                    return Ink(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(
                            color: item.value['id'] ==
                                    controller.selectedLang.value
                                ? Colors.green
                                : Colors.blue,
                            width: item.value['id'] ==
                                    controller.selectedLang.value
                                ? 2.5
                                : 1.5),
                        image: DecorationImage(
                            image: item.value['image'] as ImageProvider,
                            filterQuality: FilterQuality.low,
                            fit: BoxFit.contain),
                      ),
                      child: InkWell(
                        onTap: () {
                          controller
                              .changeLanguage(item.value['text'] as String);
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: item.value['id'] ==
                                    controller.selectedLang.value
                                ? const Icon(Icons.check_circle_rounded,
                                    color: Colors.green, size: 25)
                                : const SizedBox(),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                context.l10n.settingOther,
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
