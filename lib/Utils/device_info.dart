import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';

class DeviceInfoAPI {
  static final _deviceInfoPlugin = DeviceInfoPlugin();

  static String getOperatingSystem() {
    return Platform.operatingSystem;
  }

  static String getScreenResolution() {
    return "${window.physicalSize.width} X ${window.physicalSize.height}";
  }

  static Future<String> getPhoneInfo() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return "${info.manufacturer} - ${info.model}";
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return "${info.name} - ${info.model}";
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String> getPhoneVersion() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      print(info);
      return info.version.sdkInt.toString();
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      // print(info);
      return info.systemVersion.toString();
    } else {
      throw UnimplementedError();
    }
  }
}

class NetworkInfoAPI {
  static final info = NetworkInfo();
   static Future<String> getWifiName() async {
      var wifiName = await info.getWifiName();
      return wifiName.toString();
    }

    
   static Future<String> getWifiIP() async {
      var wifiIP = await info.getWifiIP();
      return wifiIP.toString();
    }
}

Future getNetworkInfo() async {
    final info = NetworkInfo();
    var wifiName = await info.getWifiName(); // FooNetwork
    var wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
    var wifiIP = await info.getWifiIP(); // 192.168.1.43
    var wifiIPv6 = await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
    var wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
    var wifiBroadcast = await info.getWifiBroadcast(); // 192.168.1.255
    var wifiGateway = await info.getWifiGatewayIP(); // 192.168.1.1


    print(wifiName);
    print(wifiBSSID);
    print(wifiIP);
    print(wifiIPv6);
    print(wifiSubmask);
    print(wifiBroadcast);
    print(wifiGateway);

  }