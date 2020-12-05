import 'dart:io' show Platform;
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

Future<String> getDeviceUuid() async {
  String uuid;
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      uuid = build.androidId;  //UUID for Android
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      uuid = data.identifierForVendor;  //UUID for iOS
    }
  } on PlatformException {
    print('Failed to get platform version');
    return null;
  }
  print(uuid);
  return uuid;
}