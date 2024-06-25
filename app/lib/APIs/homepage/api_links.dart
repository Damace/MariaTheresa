import 'package:app/APIs/homepage/ratibaIbada_modal.dart';
import 'package:http/http.dart' as http;

class GetRatiba {
  static var client = http.Client();
  // ignore: body_might_complete_normally_nullable
  static Future<List<Ratiba>?> fetchRatiba() async {
    try {
      var response =
          await client.get(Uri.parse('http://192.168.0.3:8000/ratiba'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return ratibaFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}




// class GetProduct {
//   static var client = http.Client();

//   static Future<List<Products>?> fetchProducts() async {
//     try {
//       var response = await client.get(Uri.parse(
//           'http://mkonekt.scienceontheweb.net/MkulimaKonekti/Controller/product/routes/routes.php/allProducts'));
   
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         print(jsonString);
//         return productsFromJson(jsonString);
//       } else {
//         //show error message
//         return null;
//       }
//     } catch (e) {
//       // make it explicit that this function can throw exceptions
//       print(e);
//     }
//   }
// }


// class GetCategory {
//   static var client = http.Client();

//   static Future<List<Category>?> fetchCategory() async {
//     try {
//       var response = await client.get(Uri.parse(
//           'http://mkonekt.scienceontheweb.net/mkulimaApp/category/getCategory.php'));
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         return categoryFromJson(jsonString);
//       } else {
//         //show error message
//         return null;
//       }
//     } catch (e) {
//       // make it explicit that this function can throw exceptions
//       print(e);
//     }
//   }
// }



// class GetDataList {
//   static Future<List<Items>?> fetchItems() async {
//     try {
//       String jsonData = await rootBundle.loadString('assets/items.json');
//       // return json.decode(jsonData);
//       var jsonString = json.decode(jsonData);
//       return itemsFromJson(jsonString);
//     } catch (e) {
//       print(e);
//     }
//   }
// }
