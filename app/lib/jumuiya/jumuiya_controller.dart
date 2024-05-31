import 'package:app/APIs/jumuiya/api_links.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:http/http.dart' as http;

class JumuiyaController extends GetxController {
  var isLoading = false.obs;
  var mahudhurioList = <Mahudhurio>[].obs;

  static var client = http.Client();

  @override
  void onInit() {
    fetchMahudhurio();
    fetchratiba();
    super.onInit();
  }

  void fetchratiba() async {
    try {
      isLoading(true);
      var mahudhurio = await fetchMahudhurio();
      if (mahudhurio != null) {
        mahudhurioList.value = mahudhurio;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<List<Mahudhurio>?> fetchMahudhurio() async {
    try {
      var response =
          await client.get(Uri.parse('http://192.168.0.3:8000/get_attendance'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return mahudhurioFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<void> insertData() async {
  //   for (var item in _items) {
  //     // print('Title: ${item.name}, Value: ${item.isChecked}');
  //     try {
  //       String uri = "http://192.168.0.103:8000/clients";
  //       var res = await http.post(Uri.parse(uri), body: {
  //         "category_entry": "Seller",
  //         "title": '${item}',
  //         "valuee": '${item.isChecked}'
  //       });

  //       var rensponse = jsonDecode(res.body);

  //       if (rensponse["status"] == true) {
  //         Get.snackbar(
  //           "Successfully",
  //           "Account has been Updated Successfully",
  //           snackPosition: SnackPosition.TOP,
  //           backgroundColor: Color.fromARGB(255, 35, 135, 40),
  //           colorText: Colors.white,
  //           icon: const Icon(Icons.error, color: Colors.white),
  //           shouldIconPulse: true,
  //           barBlur: 20,
  //         );
  //       } else {
  //         Get.snackbar(
  //           "Not Inserted",
  //           "Error",
  //           snackPosition: SnackPosition.TOP,
  //           backgroundColor: Colors.red,
  //           colorText: Colors.white,
  //           icon: const Icon(Icons.error, color: Colors.white),
  //           shouldIconPulse: true,
  //           barBlur: 20,
  //         );
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   }

  //   Get.snackbar(
  //     "hhhhhhhhhhhhhh",
  //     "Account has been Updated Successfully",
  //     snackPosition: SnackPosition.TOP,
  //     backgroundColor: Color.fromARGB(255, 35, 135, 40),
  //     colorText: Colors.white,
  //     icon: const Icon(Icons.error, color: Colors.white),
  //     shouldIconPulse: true,
  //     barBlur: 20,
  //   );
  // }
}
