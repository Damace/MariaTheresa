// ignore_for_file: unused_field

import 'dart:convert';

import 'package:app/core/utils/size_utils.dart';
import 'package:app/modals/all_modals.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class UsajiriController extends GetxController with CodeAutoFill {
  var isLoading = false.obs;
  var jumuiya = <Jumuiya>[].obs;
  var selectedJumuiya = Rx<Jumuiya?>(null);

  TextEditingController majinaKamili = TextEditingController();
  TextEditingController umli = TextEditingController();

  String selectedValue = 'Mwanaume';
  final formkey = GlobalKey<FormState>();

  //RxInt tabIndex = 0.obs;

  RxString jumuiya_value = 'hghg'.obs;

  RxString umli_value = 'Umli'.obs;
  final umli_options = ['Umli', '7 - 13', '14 - 35', '36 - 99'];

  RxString ubatizo_value = 'Ubatizo'.obs;
  final ubatizo_options = ['Ubatizo', 'Ndiyo', 'Hapana'];

  RxString ekarist_value = 'Ekarist'.obs;
  final ekarist_options = ['Ekarist', 'Ndiyo', 'Hapana'];

  RxString kipaimara_value = 'Kipaimara'.obs;
  final kipaimara_options = ['Kipaimara', 'Ndiyo', 'Hapana'];

  RxString ndoa_value = 'Ndoa'.obs;
  final ndoa_options = ['Ndoa', 'Ndiyo', 'Hapana'];

  RxString mtaa_value = 'Mtaa'.obs;
  final mtaa_options = ['Mtaa', 'Area C', 'Area D'];

  RxString kanda_value = 'Kanda'.obs;
  final kanda_options = ['Kanda', 'Samlia', 'Nasareti'];

  String selected_jumuiya = 'Jumuiya';

  String? selected_Jumuiya;

  register() {
    print(majinaKamili.text);
    print(selectedValue);
    print(umli_value);
    print(ubatizo_value);
    print(ekarist_value);
    print(kipaimara_value);
    print(ndoa_value);
    print(mtaa_value);
    print(kanda_value);

    print(selected_Jumuiya);

    Get.snackbar("${selected_Jumuiya}", "Check fon Connection then try again",
        titleText: Text(
          "No internet Connection",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.fSize,
              fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          "Check for Internet Connection then try again.",
          style: TextStyle(color: Colors.white, fontSize: 12.fSize),
        ),
        duration: 60.minutes,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withOpacity(0.25),
        colorText: Colors.white,
        icon: Icon(
          Icons.network_check_outlined,
          color: Colors.white,
        ),
        shouldIconPulse: true,
        barBlur: 120,
        mainButton:
            TextButton(onPressed: Get.back, child: const Text("Close")));
  }

  @override
  void codeUpdated() {
    // otpController.value.text = code!;
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() {
    super.onReady();
  }

//   Future<void> fetchData() async {
//     try {
//       // Replace with your actual API call
//       final response = await get(Uri.parse('https://your-api.com/data'));
//       final List<dynamic> responseData = jsonDecode(response.body);
//       data.value = responseData.map((item) => MyDataItem(item['id'], item['name'])).toList();
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }
// }

  // fetchJumuiya() async {
  //   try {
  //     isLoading(true);
  //     final response = await http.get(
  //         Uri.parse('https://app.parokiayakiwanjachandege.or.tz/jumuiya_all'));
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body) as List;
  //       // final List<dynamic> data = json.decode(response.body);
  //       // final List<dynamic> responseData = jsonDecode(response.body);

  //       final List<dynamic> data = json.decode(response.body);
  //       data.map((item) => Jumuiya.fromJson(item)).toList();

  //       // data.value = responseData.map((item) => Jumuiya.fromJson(item)).toList();

  //       print(jsonResponse);
  //       // jumuiya.value = data.map((item) => Jumuiya.fromJson(item)).toList();
  //     } else {
  //       Get.snackbar("", "Check fon Connection then try again",
  //           titleText: Text(
  //             "No internet Connection",
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 14.fSize,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           messageText: Text(
  //             "Check for Internet Connection then try again.",
  //             style: TextStyle(color: Colors.white, fontSize: 12.fSize),
  //           ),
  //           duration: 60.minutes,
  //           snackPosition: SnackPosition.TOP,
  //           backgroundColor: Colors.white.withOpacity(0.25),
  //           colorText: Colors.white,
  //           icon: Icon(
  //             Icons.network_check_outlined,
  //             color: Colors.white,
  //           ),
  //           shouldIconPulse: true,
  //           barBlur: 120,
  //           mainButton:
  //               TextButton(onPressed: Get.back, child: const Text("Close")));
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
