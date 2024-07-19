import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../components/colors.dart';

class Loader {
  static show() {
    return Get.context!.loaderOverlay.show(
      widgetBuilder: (progress) {
        return const MyLoader();
      },
    );
  }

  static hide() {
    return Get.context!.loaderOverlay.hide();
  }
}

class MyLoader extends StatelessWidget {
  const MyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(strokeWidth: 3, color: AppColor.appColor));
  }
}
