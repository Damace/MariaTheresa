// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/core/utils/size_utils.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Wanajumuiya_wapya extends StatefulWidget {
  @override
  _Wanajumuiya_wapya createState() => _Wanajumuiya_wapya();
}

class _Wanajumuiya_wapya extends State<Wanajumuiya_wapya> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.defaultcolor,
        foregroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        title: Text(
          "Mwanajumuiya mpya",
          style: TextStyle(
            fontSize: 16.fSize,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.v, right: 10.v),
        child: Container(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12.v),
                child: Row(
                  children: [
                    Text(
                      "Taarifa Binafsi",
                      style: TextStyle(
                          color: appTheme.defaultcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.fSize),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.v),
                child: FormBuilder(
                  key: _fbKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8)),
                        child: FormBuilderTextField(
                          keyboardType: TextInputType.url,
                          cursorColor: appTheme.defaultcolor,
                          name: 'majina_kamili',
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline_sharp,
                              size: 23.fSize,
                              color: appTheme.defaultcolor,
                            ),
                            labelText: "Majina Kamili",
                            labelStyle: TextStyle(
                                color: appTheme.defaultcolor,
                                fontSize: 12.fSize),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: FormBuilderRadioGroup(
                              activeColor: appTheme.defaultcolor,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                labelText: 'Changua Jinsia',
                                labelStyle: TextStyle(
                                    color: appTheme.defaultcolor,
                                    fontSize: 12.fSize,
                                    fontWeight: FontWeight.bold),
                              ),
                              // leadingInput: true,
                              name: "jinsia",
                              // validators: [FormBuilderValidators.required()],
                              options: [
                                "Mwanamume",
                                "Mwanamke",
                              ]
                                  .map((lang) =>
                                      FormBuilderFieldOption(value: lang))
                                  .toList(growable: false),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.h, right: 5.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: FormBuilderDropdown(
                                    name: "umli",

                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      labelText: "Chagua Umli",
                                      labelStyle: TextStyle(
                                        color: appTheme.defaultcolor,
                                        fontSize: 14.fSize,
                                      ),
                                    ),
                                    initialValue: '',
                                    //validator: [FormBuilderValidators.required()],
                                    items: ['0 - 13', '14 - 35', '36 - 99']
                                        .map((gender) => DropdownMenuItem(
                                            value: gender,
                                            child: Text("$gender")))
                                        .toList(),
                                  ),
                                ),
                                SizedBox(
                                  width: 150.h,
                                ),
                                Expanded(
                                  child: FormBuilderDropdown(
                                    name: "umli",
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      labelText: "Umebatizo",
                                      labelStyle: TextStyle(
                                        color: appTheme.defaultcolor,
                                        fontSize: 14.fSize,
                                      ),
                                    ),
                                    initialValue: '',
                                    //validator: [FormBuilderValidators.required()],
                                    items: ['Ndiyo', 'Hapana']
                                        .map((gender) => DropdownMenuItem(
                                            value: gender,
                                            child: Text("$gender")))
                                        .toList(),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h, right: 5.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: FormBuilderDropdown(
                                  name: "Ekarist",

                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    labelText: "Ekarist",
                                    labelStyle: TextStyle(
                                      color: appTheme.defaultcolor,
                                      fontSize: 14.fSize,
                                    ),
                                  ),
                                  initialValue: '',
                                  //validator: [FormBuilderValidators.required()],
                                  items: ['Ndiyo', 'Hapana']
                                      .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text("$gender")))
                                      .toList(),
                                ),
                              ),
                              SizedBox(
                                width: 50.h,
                              ),
                              Expanded(
                                child: FormBuilderDropdown(
                                  name: "Kipaimara",
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    labelText: "Kipaimara",
                                    labelStyle: TextStyle(
                                      color: appTheme.defaultcolor,
                                      fontSize: 14.fSize,
                                    ),
                                  ),
                                  initialValue: '',
                                  //validator: [FormBuilderValidators.required()],
                                  items: ['Ndiyo', 'Hapana']
                                      .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text("$gender")))
                                      .toList(),
                                ),
                              ),
                              SizedBox(
                                width: 50.h,
                              ),
                              Expanded(
                                child: FormBuilderDropdown(
                                  name: "ndoa",
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    labelText: "Ndoa",
                                    labelStyle: TextStyle(
                                      color: appTheme.defaultcolor,
                                      fontSize: 14.fSize,
                                    ),
                                  ),
                                  initialValue: '',
                                  //validator: [FormBuilderValidators.required()],
                                  items: ['Ndiyo', 'Hapana']
                                      .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text("$gender")))
                                      .toList(),
                                ),
                              ),
                            ]),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            "Taarifa za Jumuiya",
                            style: TextStyle(
                                color: appTheme.defaultcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.fSize),
                          )
                        ],
                      ),
                      FormBuilderDropdown(
                        name: "jumuiya",
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          labelText: "Mtaa Unaotoka",
                          labelStyle: TextStyle(
                            color: appTheme.defaultcolor,
                            fontSize: 14.fSize,
                          ),
                        ),
                        initialValue: '',
                        //validator: [FormBuilderValidators.required()],
                        items: ['Area C', 'Mnadani']
                            .map((gender) => DropdownMenuItem(
                                value: gender, child: Text("$gender")))
                            .toList(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h, right: 5.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: FormBuilderDropdown(
                                  name: "jumuiya",
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    labelText: "Jumuiya unayotoka",
                                    labelStyle: TextStyle(
                                      color: appTheme.defaultcolor,
                                      fontSize: 14.fSize,
                                    ),
                                  ),
                                  initialValue: '',
                                  //validator: [FormBuilderValidators.required()],
                                  items: ['Sina jumuiya', 'Maria']
                                      .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text("$gender")))
                                      .toList(),
                                ),
                              ),
                              SizedBox(
                                width: 50.h,
                              ),
                              Expanded(
                                child: FormBuilderDropdown(
                                  name: "Kanda",
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    labelText: "Kanda",
                                    labelStyle: TextStyle(
                                      color: appTheme.defaultcolor,
                                      fontSize: 14.fSize,
                                    ),
                                  ),
                                  initialValue: '',
                                  //validator: [FormBuilderValidators.required()],
                                  items: ['Samalia', 'Yudea', 'Sijui']
                                      .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text("$gender")))
                                      .toList(),
                                ),
                              ),
                            ]),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            "Mawasiliano",
                            style: TextStyle(
                                color: appTheme.defaultcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.fSize),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(8)),
                              child: FormBuilderTextField(
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: appTheme.defaultcolor,
                                readOnly: true,
                                name: 'phone_number',
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person_outline_sharp,
                                    size: 23.fSize,
                                    color: appTheme.defaultcolor,
                                  ),
                                  labelText: "Namba ya Simu",
                                  labelStyle: TextStyle(
                                      color: appTheme.defaultcolor,
                                      fontSize: 12.fSize),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(8)),
                              child: FormBuilderTextField(
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: appTheme.defaultcolor,
                                name: 'emai',
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    size: 23.fSize,
                                    color: appTheme.defaultcolor,
                                  ),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: appTheme.defaultcolor,
                                      fontSize: 12.fSize),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FormBuilderTextField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: appTheme.defaultcolor,
                        name: 'password',
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 23.fSize,
                            color: appTheme.defaultcolor,
                          ),
                          labelText: "Namba ya Siri (Password)",
                          labelStyle: TextStyle(
                              color: appTheme.defaultcolor, fontSize: 12.fSize),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _fbKey.currentState!.save();
                      if (_fbKey.currentState!.validate()) {
                        print(_fbKey.currentState!.value);
                      }

                      // Get.to(Register(),
                      //     duration: Duration(milliseconds: 500),
                      //     transition: Transition.fadeIn //transition effect
                      //     );
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          appTheme.defaultcolor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Wasilisha',
                        style: TextStyle(fontSize: 16.fSize),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
