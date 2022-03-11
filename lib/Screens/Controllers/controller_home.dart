import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';

class ControllerHome extends GetxController {
  final internetSpeedTest = InternetSpeedTest();
  var internetUploadingSpeed = "Checking".obs;
  var speedOnDoneUploading = "Checking".obs;
  var speedInProgressUplaoding = "Checking".obs;
  var speedErrorUploading = "Getting error".obs;

  var internetDownloadingSpeed = "Checking".obs;
  var speedOnDoneDownloading = "Checking".obs;
  var speedInProgressDownloading = "Checking".obs;
  var speedErrorDownloading = "Getting Error".obs;

  var isUploadingCompleted = false.obs;
  var isDownloadingCompleted = false.obs;

  var connectionType = "Checking".obs;

 

  Future checkInternetConnectionUsingConnectivityPlus(ConnectivityResult result) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (result == ConnectivityResult.mobile) {
      connectionType.value = "Mobile Data";
      Get.snackbar("Good", "You are connected to the Mobile internet");
    } else if (result == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      connectionType.value = "Wifi";
      Get.snackbar("Good", "You are connected to the WiFi");
    } else {
      connectionType.value = "You are not Connected to the internet";
      Get.snackbar("Sorry", "You are not connected to the internet");
    }
  }

  checkInternetConnectionUsingInternetConnectionChecker() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      Get.snackbar("Good", "You are connected to the internet");
    } else {
      Get.snackbar("Sorry", "You are not connected to the internet");
    }
  }
  // checking internet speed......

  checkInternetUploadingSpeed() {
    internetSpeedTest.startUploadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate');
        print("/////////////////////////////$unit");
        speedOnDoneUploading.value = "$transferRate $unit";
        checkInternetDownlaodingSpeed();
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        var unitInKBS = SpeedUnit.Kbps;
        var unitInMBs = SpeedUnit.Mbps;
        print('the transfer rate $transferRate, the percent $percent');
        speedInProgressUplaoding.value = "$transferRate $unit & ${percent.toStringAsFixed(2)}%";
      },
      onError: (String errorMessage, String speedTestError) {
        speedErrorUploading.value = errorMessage.toString();
        // TODO: Show toast error
      },
    );
  }

  checkInternetDownlaodingSpeed() {
    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate');

        speedOnDoneDownloading.value = "$transferRate & unit: $unit";
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate, the percent $percent');
        speedInProgressDownloading.value = "TR: $transferRate Mbps & ${percent.toStringAsFixed(2)}%";
      },
      onError: (String errorMessage, String speedTestError) {
        speedErrorUploading.value = errorMessage;
        // TODO: Show toast error
      },
    );
  }
}

