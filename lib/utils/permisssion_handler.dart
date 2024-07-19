import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

// --------- handle any type of permission -----------
Future<bool?> permissionHandler(Permission? permission) async {
  bool access = false;
  try {
    Map<Permission, PermissionStatus> statues = await [permission!].request();
    // String? name = permission.toString().replaceAll("Permission.", "");
    // String? title = name.replaceAll("Permission.", "").toString().capitalize;
    PermissionStatus? status = statues[permission];
    bool isGranted = (status == PermissionStatus.granted || status == PermissionStatus.limited);
    if (isGranted) {
      access = true;
    } else if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  } on Exception catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return access;
}
