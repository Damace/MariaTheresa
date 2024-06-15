// /// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

// import 'package:app/core/utils/size_utils.dart';
// import 'package:app/jumuiya/jumuiya_login.dart';
// import 'package:app/theme/theme_helper.dart';
// import 'package:app/usajiri/usajili_controler.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Usajiri extends StatefulWidget {
//   @override
//   _Usajiri createState() => _Usajiri();
// }

// class _Usajiri extends State<Usajiri> {
//   UsajiriController usajiliController = Get.put(UsajiriController());

//   List data = [];

//   int _value = 1;

//   @override
//   void initState() {
//     super.initState();

//     // fetchdata();
//     //usajiliController.fetchJumuiya();
//   }

//   void _handleRadioValueChange(String? value) {
//     setState(() {
//       usajiliController.selectedValue = value!;
//     });
//   }

//   fetchdata() async {
//     final response = await http.get(
//         Uri.parse('https://app.parokiayakiwanjachandege.or.tz/jumuiya_all'));

//     data = jsonDecode(response.body);

//     if (mounted) {
//       setState(() {
//         // make your changes here
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // fetchdata();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appTheme.defaultcolor,
//         foregroundColor: Colors.white,
//         // automaticallyImplyLeading: false,
//         title: Text(
//           "Kamilisha Usajili",
//           style: TextStyle(
//             fontSize: 16.fSize,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.only(left: 10.v, right: 10.v),
//         child: Container(
//             child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 12.v),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Taarifa Binafsi",
//                       style: TextStyle(
//                           color: appTheme.defaultcolor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14.fSize),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 10.v),
//                 child: FormBuilder(
//                   key: usajiliController.formkey,
//                   autovalidateMode: AutovalidateMode.always,
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.05),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: FormBuilderTextField(
//                           controller: usajiliController.majinaKamili,
//                           keyboardType: TextInputType.text,
//                           cursorColor: appTheme.defaultcolor,
//                           name: 'majina_kamili',
//                           decoration: InputDecoration(
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.transparent),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.person_outline_sharp,
//                               size: 23.fSize,
//                               color: appTheme.defaultcolor,
//                             ),
//                             labelText: "Majina Kamili",
//                             labelStyle: TextStyle(
//                                 color: appTheme.defaultcolor,
//                                 fontSize: 12.fSize),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Row(
//                             children: [
//                               Radio<String>(
//                                 value: 'Mwanaume',
//                                 groupValue: usajiliController.selectedValue,
//                                 onChanged: _handleRadioValueChange,
//                                 activeColor: appTheme.defaultcolor,
//                                 // Custom color for selected radio button
//                               ),
//                               Text("Mwanaume",
//                                   textAlign: TextAlign.right,
//                                   style: TextStyle(
//                                       fontSize: 14.fSize,
//                                       fontWeight: FontWeight.bold,
//                                       color: appTheme.defaultcolor)),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Radio<String>(
//                                 value: 'Mwanamke',
//                                 groupValue: usajiliController.selectedValue,
//                                 onChanged: _handleRadioValueChange,
//                                 activeColor: appTheme.defaultcolor,
//                                 // Custom color for selected radio button
//                               ),
//                               Text("Mwanamke",
//                                   textAlign: TextAlign.right,
//                                   style: TextStyle(
//                                       fontSize: 14.fSize,
//                                       fontWeight: FontWeight.bold,
//                                       color: appTheme.defaultcolor)),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.05),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5.h, right: 5.h),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Obx(
//                                     () => DropdownButton<String>(
//                                       // hint: Text("Chagua Umli"),
//                                       value: usajiliController.umli_value.value,
//                                       onChanged: (newValue) {
//                                         usajiliController.umli_value.value =
//                                             newValue!;
//                                       },
//                                       items: usajiliController.umli_options
//                                           .map<DropdownMenuItem<String>>(
//                                               (String value) {
//                                         return DropdownMenuItem<String>(
//                                           value: value,
//                                           child: Text(
//                                             value,
//                                             style: TextStyle(
//                                                 fontSize: 12.fSize,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: appTheme.defaultcolor),
//                                           ),
//                                         );
//                                       }).toList(),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 150.h,
//                                 ),
//                                 Expanded(
//                                   child: Obx(
//                                     () => DropdownButton<String>(
//                                       value:
//                                           usajiliController.ubatizo_value.value,
//                                       onChanged: (newValue) {
//                                         usajiliController.ubatizo_value.value =
//                                             newValue!;
//                                       },
//                                       items: usajiliController.ubatizo_options
//                                           .map<DropdownMenuItem<String>>(
//                                               (String value) {
//                                         return DropdownMenuItem<String>(
//                                           value: value,
//                                           child: Text(
//                                             value,
//                                             style: TextStyle(
//                                                 fontSize: 12.fSize,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: appTheme.defaultcolor),
//                                           ),
//                                         );
//                                       }).toList(),
//                                     ),
//                                   ),
//                                 ),
//                               ]),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 5.h, right: 5.h),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Obx(
//                                   () => DropdownButton<String>(
//                                     value:
//                                         usajiliController.ekarist_value.value,
//                                     onChanged: (newValue) {
//                                       usajiliController.ekarist_value.value =
//                                           newValue!;
//                                     },
//                                     items: usajiliController.ekarist_options
//                                         .map<DropdownMenuItem<String>>(
//                                             (String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(
//                                           value,
//                                           style: TextStyle(
//                                               fontSize: 12.fSize,
//                                               fontWeight: FontWeight.bold,
//                                               color: appTheme.defaultcolor),
//                                         ),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 50.h,
//                               ),
//                               Expanded(
//                                 child: Obx(
//                                   () => DropdownButton<String>(
//                                     value:
//                                         usajiliController.kipaimara_value.value,
//                                     onChanged: (newValue) {
//                                       usajiliController.kipaimara_value.value =
//                                           newValue!;
//                                     },
//                                     items: usajiliController.kipaimara_options
//                                         .map<DropdownMenuItem<String>>(
//                                             (String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(
//                                           value,
//                                           style: TextStyle(
//                                               fontSize: 12.fSize,
//                                               fontWeight: FontWeight.bold,
//                                               color: appTheme.defaultcolor),
//                                         ),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 50.h,
//                               ),
//                               Expanded(
//                                   child: Obx(
//                                 () => DropdownButton<String>(
//                                   value: usajiliController.ndoa_value.value,
//                                   onChanged: (newValue) {
//                                     usajiliController.ndoa_value.value =
//                                         newValue!;
//                                   },
//                                   items: usajiliController.ndoa_options
//                                       .map<DropdownMenuItem<String>>(
//                                           (String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(
//                                         value,
//                                         style: TextStyle(
//                                             fontSize: 12.fSize,
//                                             fontWeight: FontWeight.bold,
//                                             color: appTheme.defaultcolor),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               )),
//                             ]),
//                       ),
//                       Divider(),
//                       Row(
//                         children: [
//                           Text(
//                             "Taarifa za Jumuiya",
//                             style: TextStyle(
//                                 color: appTheme.defaultcolor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14.fSize),
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 10.h, right: 10.h),
//                         child: Expanded(
//                             child: Obx(
//                           () => DropdownButton<String>(
//                             value: usajiliController.mtaa_value.value,
//                             onChanged: (newValue) {
//                               usajiliController.mtaa_value.value = newValue!;
//                             },
//                             items: usajiliController.mtaa_options
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                   style: TextStyle(
//                                       fontSize: 12.fSize,
//                                       fontWeight: FontWeight.bold,
//                                       color: appTheme.defaultcolor),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         )),
//                       ),
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SizedBox(
//                               width: 50.h,
//                             ),
//                             Expanded(
//                                 child: Obx(
//                               () => DropdownButton<String>(
//                                 value: usajiliController.kanda_value.value,
//                                 onChanged: (newValue) {
//                                   usajiliController.kanda_value.value =
//                                       newValue!;
//                                 },
//                                 items: usajiliController.kanda_options
//                                     .map<DropdownMenuItem<String>>(
//                                         (String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(
//                                       value,
//                                       style: TextStyle(
//                                           fontSize: 12.fSize,
//                                           fontWeight: FontWeight.bold,
//                                           color: appTheme.defaultcolor),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             )),
//                             SizedBox(
//                               width: 50.h,
//                             ),
//                             DropdownButton(
//                               hint: Text(
//                                 "Jumuiya",
//                                 style: TextStyle(
//                                     fontSize: 12.fSize,
//                                     fontWeight: FontWeight.bold,
//                                     color: appTheme.defaultcolor),
//                               ),
//                               items: data.map((e) {
//                                 return DropdownMenuItem(
//                                     child: Text(
//                                       e["jina"],
//                                       style: TextStyle(
//                                           fontSize: 12.fSize,
//                                           fontWeight: FontWeight.bold,
//                                           color: appTheme.defaultcolor),
//                                     ),
//                                     value: e["id"]);
//                               }).toList(),
//                               value: _value,
//                               onChanged: (v) {
//                                 _value = v as int;
//                                 setState(() {});
//                               },
//                             ),
//                           ]),
//                       Divider(),
//                       Row(
//                         children: [
//                           Text(
//                             "Mawasiliano / Namba ya Siri",
//                             style: TextStyle(
//                                 color: appTheme.defaultcolor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14.fSize),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.black.withOpacity(0.05),
//                                   borderRadius: BorderRadius.circular(8)),
//                               child: FormBuilderTextField(
//                                 keyboardType: TextInputType.visiblePassword,
//                                 cursorColor: appTheme.defaultcolor,
//                                 readOnly: true,
//                                 name: 'phone_number',
//                                 decoration: InputDecoration(
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide:
//                                         BorderSide(color: Colors.transparent),
//                                   ),
//                                   prefixIcon: Icon(
//                                     Icons.person_outline_sharp,
//                                     size: 23.fSize,
//                                     color: appTheme.defaultcolor,
//                                   ),
//                                   labelText: "Namba ya Simu",
//                                   labelStyle: TextStyle(
//                                       color: appTheme.defaultcolor,
//                                       fontSize: 12.fSize),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.black.withOpacity(0.05),
//                                   borderRadius: BorderRadius.circular(8)),
//                               child: FormBuilderTextField(
//                                 keyboardType: TextInputType.visiblePassword,
//                                 cursorColor: appTheme.defaultcolor,
//                                 name: 'password',
//                                 decoration: InputDecoration(
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide:
//                                         BorderSide(color: Colors.transparent),
//                                   ),
//                                   prefixIcon: Icon(
//                                     Icons.lock_outline,
//                                     size: 23.fSize,
//                                     color: appTheme.defaultcolor,
//                                   ),
//                                   labelText: "Namba ya Siri (Password)",
//                                   labelStyle: TextStyle(
//                                       color: appTheme.defaultcolor,
//                                       fontSize: 12.fSize),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Divider(),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       usajiliController.register();
//                       // _fbKey.currentState!.save();
//                       // if (_fbKey.currentState!.validate()) {
//                       //   print(_fbKey.currentState!.value);
//                       // }

//                       // // Get.to(Register(),
//                       // //     duration: Duration(milliseconds: 500),
//                       // //     transition: Transition.fadeIn //transition effect
//                       // //     );
//                     },
//                     style: ButtonStyle(
//                       foregroundColor:
//                           MaterialStateProperty.all<Color>(Colors.white),
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           appTheme.defaultcolor),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(14.0),
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(fontSize: 16.fSize),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }
