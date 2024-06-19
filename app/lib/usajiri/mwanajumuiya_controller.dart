// ignore_for_file: unused_field, prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:app/core/utils/size_utils.dart';
import 'package:app/jumuiya/jumuiya_home.dart';
import 'package:app/modals/all_modals.dart';
import 'package:app/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class MwanajumuiyaController extends GetxController with CodeAutoFill {
  var isLoading = false.obs;
  var jumuiya = <Jumuiya>[].obs;
  var selectedJumuiya = Rx<Jumuiya?>(null);

  TextEditingController majinaKamili = TextEditingController();
  TextEditingController umli = TextEditingController();

  TextEditingController namba = TextEditingController(text: "0123456");
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();

  String selectedValue = 'Mwanaume';
  final formkey = GlobalKey<FormState>();

  //RxInt tabIndex = 0.obs;

  //RxString jumuiya_value = 'hghg'.obs;

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
  final mtaa_options = [
    'Mtaa',
    'Area C',
    'Area D',
    'Chang`ombe',
    'Miyuji mbwanga',
    'Mailimbili',
    'Chango`ombe Usomalini',
    'Chinangali C',
    'Chang`ombe Extension',
    'Mnadani'
  ];

  RxString kanda_value = 'Kanda'.obs;
  final kanda_options = [
    'Kanda',
    'Yudea',
    'Galilaya',
    'Yeriko',
    'Nazareti',
    'Bethlehemu',
    'Vatican',
    'Yerusalemu',
    'Samaria',
    'Gethesmani'
  ];

  String shared_jumuiya = '';

  void submit() async {
    String url = "https://app.parokiayakiwanjachandege.or.tz/wanaparokia";

    var response = await http.post(Uri.parse(url), body: {
      "majina_kamili": "${majinaKamili.text}",
      "jinsia": selectedValue,
      "umli": "${umli_value}",
      "ubatizo": "${ubatizo_value}",
      "ekarist": "${ekarist_value}",
      "kipaimara": "${kipaimara_value}",
      "ndoa": "${ndoa_value}",
      "mtaa": "${mtaa_value}",
      "kanda": "${kanda_value}",
      "namba": "${namba.text}",
      "jumuiya": "${shared_jumuiya}",
      "password": "${password.text}"
    });

    var rensponse = jsonDecode(response.body);

    if (rensponse["status"] == true) {
      Get.snackbar(
        "",
        "",
        titleText: Text(
          "Submitted Successfully",
          style: TextStyle(
            fontSize: 14.fSize,
            color: Colors.white,
          ),
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[800],
        colorText: Colors.white,
        icon: const Icon(Icons.church, color: Colors.white),
        shouldIconPulse: true,
        barBlur: 20,
      );

      majinaKamili.clear();
      namba.clear();
      password.clear();
      Get.to(Jumuiya_home(),
          duration: Duration(milliseconds: 500),
          transition: Transition.fadeIn //transition effect
          );
    } else {
      Fluttertoast.showToast(
          msg: "Check for internet Connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // register() async {
  // print(majinaKamili.text);
  // print(selectedValue);
  // print(umli_value);
  // print(ubatizo_value);
  // print(ekarist_value);
  // print(kipaimara_value);
  // print(ndoa_value);
  // print(mtaa_value);
  // print(kanda_value);
  // print(namba.text);
  // print(password.text);
  // print(password2.text);
  // print(value);

  //   if (password.text == password2.text) {
  //     try {
  //       String uri = "https://app.parokiayakiwanjachandege.or.tz/wanaparokia";
  //       var res = await http.post(Uri.parse(uri), body: {
  //         "majina_kamili": '${majinaKamili.text}',
  //         "jinsia": '${selectedValue}',
  //         "umli": '${umli_value}',
  //         "ubatizo": '${ubatizo_value}',
  //         "ekarist": '${ekarist_value}',
  //         "kipaimara": '${kipaimara_value}',
  //         "ndoa": '${ndoa_value}',
  //         "mtaa": '${mtaa_value}',
  //         "kanda": '${kanda_value}',
  //         "namba": '${namba.text}',
  //         "password": '${password.text}'
  //       });

  //       var rensponse = jsonDecode(res.body);
  //       if (rensponse["status"] == true) {
  //         Get.snackbar("", "",
  //             titleText: Text(
  //               "Registered Successfully",
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 14.fSize,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //             messageText: Text(
  //               "Check for Internet Connection then try again.",
  //               style: TextStyle(color: Colors.white, fontSize: 12.fSize),
  //             ),
  //             duration: 500.milliseconds,
  //             snackPosition: SnackPosition.TOP,
  //             backgroundColor: Colors.green[800],
  //             colorText: Colors.white,
  //             icon: Icon(
  //               Icons.check_circle_outline,
  //               color: Colors.white,
  //             ),
  //             shouldIconPulse: true,
  //             barBlur: 120,
  //             mainButton:
  //                 TextButton(onPressed: Get.back, child: const Text("Close")));
  //       } else {
  //         Fluttertoast.showToast(
  //             msg: "Massage do note match",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.CENTER,
  //             timeInSecForIosWeb: 1,
  //             textColor: Colors.white,
  //             fontSize: 16.0);
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     print("ddd");
  //   }
  // }

  @override
  void codeUpdated() {}

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
