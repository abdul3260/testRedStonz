import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:testproject_redstonz/Utils/device_info.dart';
import 'package:testproject_redstonz/Utils/ip_address.dart';
import 'package:testproject_redstonz/Utils/network_info.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({Key? key}) : super(key: key);

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  Map<String, dynamic> map = {};
  final networkInfo = NetworkInfoAPI();

  @override
  void initState() {
    init();

    super.initState();
  }

  Future init() async {
    final ipAddresss = await IpInfoApi.getIPAddress();
    final phone = await DeviceInfoAPI.getPhoneInfo();
    // final phoneVersion = DeviceInfoAPI.getPhoneVersion();
    final operatingSystem = DeviceInfoAPI.getOperatingSystem();
    final screenResolution = DeviceInfoAPI.getScreenResolution();

    print(networkInfo);
    if (!mounted) return;
    setState(() {
      map = {
        "IPAddress": ipAddresss,
        "Phone": phone,
        // "phoneVersion": phoneVersion,
        "operatingSystem": operatingSystem,
        "screenResolution": screenResolution,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(map);
    getNetworkInfo();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              info("Device Info"),
              const SizedBox(
                height: 20,
              ),
              infoRow(title: "Device Name", value: map["Phone"].toString()),
              infoRow(title: "Device IP Address", value: map["IPAddress"].toString()),
              // infoRow(title: "Phone Version", value: map["phoneVersion"].toString()),
              infoRow(title: "Operating System", value: map["operatingSystem"].toString()),
              infoRow(title: "Screen Resolution", value: map["screenResolution"].toString()),

              ElevatedButton(
                onPressed: () {},
                child: Text("Save Records"),
              ),
              Center(child: CircularProgressIndicator()),

              const SizedBox(
                height: 50,
              ),
              info("Network Info"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget info(titile) {
    return Text(
      titile,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 7, 67, 116),
      ),
    );
  }

  Widget infoRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromARGB(255, 3, 65, 116),
          ),
        ),
        Text(value),
      ],
    );
  }
}
