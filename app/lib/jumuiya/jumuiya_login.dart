// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_new, sort_child_properties_last

import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:app/APIs/homepage/fomuHuduma_modal.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/jumuiya/jumuiya_login_controller.dart';
import 'package:app/jumuiya/jumuiya_login_modal.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:searchfield/searchfield.dart';
import 'package:http/http.dart' as http;

class Jumuiya extends StatefulWidget {
  @override
  State<Jumuiya> createState() => _Jumuiya();
}

class _Jumuiya extends State<Jumuiya> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Jumuiya_login_Controller jumuiya_login = Jumuiya_login_Controller();
  final Jumuiya_login_Controller albumController =
      Get.put(Jumuiya_login_Controller());

  final _formKey = GlobalKey<FormState>();
  // final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  // final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  // final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  // final _userEditTextController = TextEditingController(text: 'Mrs');

  String dropdownValue = 'Option 1';




  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 30.v, right: 15.h, left: 15.h),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideInRight(
                child: Container(
                  width: 180.h,
                  height: 180.v,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              SizedBox(height: 10.v),
              Text(
                "",
                style: TextStyle(
                  fontSize: 12.fSize,
                ),
              ),
              SizedBox(height: 20.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Text(
                      "Kwa matumizi ya Jumuiya tu.",
                      style: TextStyle(
                          fontSize: 14.fSize,
                          color: appTheme.defaultcolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.v,
              ),
              FormBuilder(
                key: _fbKey,
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: [],
                      // items: dat.map<DropdownMenuItem<Items>>((String value) {
                      //   return DropdownMenuItem<Items>(
                      //     value: value,
                      //     child: Text(value),
                      //   );
                      // }).toList(),
                    ),

                    DropdownSearch<String>(
                      //key: ,
                      //showSearchBox: true,
                      items: ["Brazil", "Italy", "Tunisia", 'Canada'],
                      // hint: "Select a country",
                      onChanged: print,
                      selectedItem: "Brazil",
                    ),



                  


// GFSearchBar(
//   //searchList: list,
//    searchList: jumuiya_login.data,
//   searchQueryBuilder: (query, list) {
//     return jumuiya_login.data
//         .map((item) =>
//             item..) .toList();
//   },

//   overlaySearchListItemBuilder: (item) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       child: Text(
//         item.name,
//         style: const TextStyle(fontSize: 18),
//       ),
//     );
//   },
//   onItemSelected: (item) {
//     setState(() {
//       print('$item');
//     });
//   },
// ),

              //       DropdownSearch<Album>(
              //         key: _multiKey,
              //         itemAsString: (Album album) => album.title,

              //                   items: item.map((item) {
              //   return new DropdownMenuItem(
              //     child:  Text(item['first_name']+" "+ item['last_name']),
              //     value: item['emp_code'].toString(),
              //   );
              // }).toList(),
              

              //         popupProps: PopupProps.bottomSheet(
              //             bottomSheetProps: BottomSheetProps(
              //                 elevation: 16, backgroundColor: Colors.white)),

              //         dropdownDecoratorProps: DropDownDecoratorProps(
              //           dropdownSearchDecoration: InputDecoration(
              //             labelText: "Modal mode",
              //             hintText: "Select an Int",
              //             filled: true,
              //           ),
              //         ),
              //         onChanged: (Album? album) {
              //           print('Selected album: ${album?.title}');
              //         },
              //       ),



//        DropdownSearch<Album>(
//        // items: albums,
//         itemAsString: (Album album) => album.title,
//         onChanged: (Album? album) {
//           if (album != null) {
//             print('Selected album: ${album.title}');
//           }
//         },
//         dropdownBuilder: (context, selectedItem) {
//           return ListTile(
//             title: Text(selectedItem?.title ?? 'Select an album'),
//           );
//         },
//         popupItemBuilder: (context, item, isSelected) {
//           return ListTile(
//             title: Text(item.title),
//           );
//         },
//         dropdownSearchDecoration: InputDecoration(
//           labelText: 'Albums',
//           hintText: 'Select an album',
//         ),
//       );
//     }
//   },
// );






                    //              Obx(() {
                    //   if (albumController.isLoading.value) {
                    //     return CircularProgressIndicator();
                    //   } else {
                    //     return Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: DropdownSearch<Album>(
                    //         mode: Mode.DIALOG,
                    //         showSearchBox: true,
                    //         items: albumController.albums,
                    //         itemAsString: (Album album) => album.title,
                    //         onChanged: (Album? album) {
                    //           // Handle dropdown item selection
                    //           if (album != null) {
                    //             print('Selected Album: ${album.title}');
                    //           }
                    //         },
                    //         dropdownBuilder: _customDropDown,
                    //         popupItemBuilder: _customPopupItem,
                    //       ),
                    //     );
                    //   }
                    // }),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.15),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: appTheme.defaultcolor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h, right: 8.h),
                          child: FormBuilderTextField(
                            controller: jumuiya_login.jumuiya,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: appTheme.defaultcolor,
                            name: 'Username',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.15)),
                              ),
                              labelText: "Username",
                              labelStyle: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.15),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: appTheme.defaultcolor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h, right: 8.h),
                          child: FormBuilderTextField(
                            controller: jumuiya_login.jumuiya_password,
                            obscureText: true,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: appTheme.defaultcolor,
                            name: 'password',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.15)),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 25.v),
                    child: ElevatedButton(
                      onPressed: () {
                        // jumuiya_login.register();
                        if (_fbKey.currentState!.validate()) {
                          // jumuiya_login.register();
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            appTheme.defaultcolor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Log in',
                          style: TextStyle(fontSize: 16.fSize),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _customDropDown(BuildContext context, Album? item) {
    if (item == null) {
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text("No album selected"),
      );
    }

    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(item.title),
    );
  }

  Widget _customPopupItem(BuildContext context, Album item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.title),
        subtitle: Text('Album ID: ${item.id}'),
      ),
    );
  }
}
