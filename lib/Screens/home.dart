import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject_redstonz/Screens/device_info.dart';
import 'package:testproject_redstonz/Screens/interactive_screen.dart';
import 'package:testproject_redstonz/Screens/my_home_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(DeviceInfo());
              },
              child: const Text("Device Info"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(InteractiveScreeen());
                },
                child: const Text("Draggable Widgets")),
            ElevatedButton(
                onPressed: () {
                  Get.to(MyHomePage());
                },
                child: const Text("Internet Connectivity")),
          ],
        ),
      ),
    );
  }
}
