import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:testproject_redstonz/Screens/Controllers/controller_home.dart';
import 'package:testproject_redstonz/Screens/screen_internet_speed_test.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(ControllerHome());

  final internetSpeedTest = InternetSpeedTest();

  var subscription;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        controller.checkInternetConnectionUsingConnectivityPlus(result);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Speed Checker"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        child: Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              Text(
                "you are using ${controller.connectionType.value}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "DownStream: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("DownStream on done"),
                  Text(
                    controller.speedOnDoneDownloading.value,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("DownStream in progress"),
                  Text(
                    controller.speedInProgressDownloading.value,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("DownStream error"),
                  Text(
                    controller.speedErrorDownloading.value,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "UpStream: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Upstream on done"),
                  Text(
                    controller.speedOnDoneUploading.value,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("UpStream in progress"),
                  Text(
                    controller.speedInProgressUplaoding.value,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("UpStream Error"),
                  Text(
                    controller.speedErrorUploading.value,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.checkInternetUploadingSpeed();
                    },
                    child: const Text("UpStream Test"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.checkInternetDownlaodingSpeed();
                    },
                    child: const Text("DownStream Test"),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // controller.checkinUploadingSpeed();
                  // controller.checkingDownloadingSpeed();
                  controller.checkInternetConnectionUsingInternetConnectionChecker();
                },
                child: const Text("Check Internet Connection"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(ScreenInternetSpeedTest());
                },
                child: const Text("Start Test"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
