import 'package:app/APIs/homepage/api_links.dart';
import 'package:app/APIs/homepage/ratibaIbada_modal.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RatibaController extends GetxController {
  var ratiba_za_ibada = <Ratiba>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchratiba();
    super.onInit();
  }

  void fetchratiba() async {
    try {
      isLoading(true);
      var ratiba = await GetRatiba.fetchRatiba();
      if (ratiba != null) {
        ratiba_za_ibada.value = ratiba;
      }
    } finally {
      isLoading(false);
    }
  }
}
