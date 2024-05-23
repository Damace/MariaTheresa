import 'dart:io';
import 'package:app/APIs/homepage/api_links.dart';
import 'package:app/APIs/homepage/fomuHuduma_modal.dart';
import 'package:app/APIs/homepage/ratibaIbada_modal.dart';
import 'package:app/notification/notification.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  var ratibaList = <Ratiba>[].obs;
  var fomuList = <Fomu>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchratiba();
    fetchfomu();
//    configOneSignel();
    super.onInit();
  }

  // void configOneSignel() {
  //   OneSignal.initialize(KappId);

  //   OneSignal.Notifications.addClickListener((event) {
  //     Get.to(Notification_screen());
  //   });
  // }

  Future<void> requestDownload(String _url, String _name) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      final dir =
          await getApplicationDocumentsDirectory(); //From path_provider package

      var _localPath = dir.path + _name;
      final savedDir = Directory(_localPath);
      await savedDir.create(recursive: true).then((value) async {
        String? _taskid = await FlutterDownloader.enqueue(
          url: _url,
          fileName: _name,
          savedDir: _localPath,
          showNotification: true,
          openFileFromNotification: true,
        );
        print(_taskid);
      });
    } else {
      print("Permission denied");
    }
  }

  void fetchratiba() async {
    try {
      isLoading(true);
      var ratiba_za_ibada = await GetRatiba.fetchRatiba();
      if (ratiba_za_ibada != null) {
        ratibaList.value = ratiba_za_ibada;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchfomu() async {
    try {
      isLoading(true);
      var fomu_za_huduma = await Get_fomu_za_huduma.fetchfomu_za_huduma();
      if (fomu_za_huduma != null) {
        fomuList.value = fomu_za_huduma;
      }
    } finally {
      isLoading(false);
    }
  }
}
