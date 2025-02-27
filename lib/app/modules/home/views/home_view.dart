import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_change_language/app/modules/setting/bindings/setting_binding.dart';
import 'package:getx_change_language/app/modules/setting/views/setting_view.dart';
import 'package:getx_change_language/app/utils/language_extension.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appBar),
        centerTitle: true,
        actions: [
          PopupMenuItem(
            child: MenuAnchor(
              builder: (context, controller, child) => IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(Icons.more_vert_rounded)),
              menuChildren: [
                MenuItemButton(
                  onPressed: () {
                    Get.to(() => const SettingView(),
                        binding: SettingBinding());
                  },
                  child: Text(context.l10n.settingBtn),
                ),
                MenuItemButton(
                  onPressed: () {
                    controller.clearPref();
                  },
                  child: Text(context.l10n.clearPref),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 90,
                  child: Image(
                    image: controller.flagImage['image'] as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  context.l10n.description,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
