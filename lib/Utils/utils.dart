import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:size_setter/size_setter.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/constants.dart';
import 'package:tikichat_app/Utils/tk_logger.dart';

T success<T>(T data) {
  const TkLogger().view(data: data);
  return data;
}

bool fail(String error) {
  const TkLogger().error(data: error);
  tkToast(msg: error);
  return false;
}

void tkToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: const Color.fromARGB(255, 42, 42, 42),
    textColor: Colors.white,
    fontSize: 13.sp,
  );
}

double getTextSize(num size) {
  return textScale
      .scale(getSizeByScreen(mobile: size.sp, smallTablet: size.px, rotateTablet: size.px));
}

double getWidth(num size) {
  return size.w;
}

double getHeight(num size) {
  return size.h;
}

double getPercentWidth(num size) {
  return size.pw;
}

double getPercentHeight(num size) {
  return size.ph;
}

double getPixel(num size) {
  return size.px;
}

double getSizeByScreen(
    {required double mobile,
    required double smallTablet,
    required double rotateTablet,
    double? miniTablet}) {
  double pointValue = deviceWidth;
  if (isRotate) {
    return rotateTablet;
  } else if (pointValue >= BreakPointEnum.ROTATE.size) {
    return smallTablet;
  } else if (pointValue >= BreakPointEnum.MINITABLET.size && miniTablet != null) {
    return miniTablet;
  } else {
    return mobile;
  }
}

String changeQueryToString(Map<String, dynamic> query) {
  return query.entries.where((e) => e.value != null).map((e) => '${e.key}=${e.value}').join('&');
}

Uri getUrl(
  String server, [
  String? path,
  Map<String, dynamic>? query,
]) {
  List<String> url = [server];

  if (path != null) url.add(path);
  if (query != null) {
    url.add('?');
    url.add(changeQueryToString(query));
  }
  return Uri.parse(url.join(''));
}

Future<(dynamic, String)?> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final ip = await IpAddress(type: RequestType.json).getIpAddress();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return (ip['ip'], androidInfo.device);
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return (ip['ip'], iosInfo.name);
  } else {
    return null;
  }
}
