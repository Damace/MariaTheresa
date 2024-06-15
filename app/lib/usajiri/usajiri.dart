// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:app/core/utils/size_utils.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/usajiri/usajili_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Usajiri extends StatefulWidget {
  @override
  _Usajiri createState() => _Usajiri();
}

class _Usajiri extends State<Usajiri> {
  UsajiriController usajiliController = Get.put(UsajiriController());

  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();

    fetchdata();
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      usajiliController.selectedValue = value!;
    });
  }

  fetchdata() async {
    final response = await http.get(
        Uri.parse('https://app.parokiayakiwanjachandege.or.tz/jumuiya_all'));

    usajiliController.data = jsonDecode(response.body);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // fetchdata();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.defaultcolor,
        foregroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        title: Text(
          "Kamilisha Usajili",
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

// ------------------------------------------------------------------------------------------------------------
              Padding(
                padding: EdgeInsets.only(top: 10.v),
                child: FormBuilder(
                  key: usajiliController.formkey,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8)),
                        child: FormBuilderTextField(
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          controller: usajiliController.majinaKamili,
                          keyboardType: TextInputType.text,
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

                      SizedBox(height: 25.v),

                      Row(
                        children: [
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Mwanaume',
                                groupValue: usajiliController.selectedValue,
                                onChanged: _handleRadioValueChange,
                                activeColor: appTheme.defaultcolor,
                                // Custom color for selected radio button
                              ),
                              Text("Mwanaume",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 14.fSize,
                                      fontWeight: FontWeight.bold,
                                      color: appTheme.defaultcolor)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Mwanamke',
                                groupValue: usajiliController.selectedValue,
                                onChanged: _handleRadioValueChange,
                                activeColor: appTheme.defaultcolor,
                                // Custom color for selected radio button
                              ),
                              Text("Mwanamke",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 14.fSize,
                                      fontWeight: FontWeight.bold,
                                      color: appTheme.defaultcolor)),
                            ],
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
                                  child: Obx(
                                    () => DropdownButton<String>(
                                      // hint: Text("Chagua Umli"),
                                      value: usajiliController.umli_value.value,
                                      onChanged: (newValue) {
                                        usajiliController.umli_value.value =
                                            newValue!;
                                      },
                                      items: usajiliController.umli_options
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                fontSize: 12.fSize,
                                                fontWeight: FontWeight.bold,
                                                color: appTheme.defaultcolor),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150.h,
                                ),
                                Expanded(
                                  child: Obx(
                                    () => DropdownButton<String>(
                                      value:
                                          usajiliController.ubatizo_value.value,
                                      onChanged: (newValue) {
                                        usajiliController.ubatizo_value.value =
                                            newValue!;
                                      },
                                      items: usajiliController.ubatizo_options
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                fontSize: 12.fSize,
                                                fontWeight: FontWeight.bold,
                                                color: appTheme.defaultcolor),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),

                      SizedBox(height: 25.v),

                      Padding(
                        padding: EdgeInsets.only(left: 5.h, right: 5.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Obx(
                                  () => DropdownButton<String>(
                                    value:
                                        usajiliController.ekarist_value.value,
                                    onChanged: (newValue) {
                                      usajiliController.ekarist_value.value =
                                          newValue!;
                                    },
                                    items: usajiliController.ekarist_options
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 12.fSize,
                                              fontWeight: FontWeight.bold,
                                              color: appTheme.defaultcolor),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50.h,
                              ),
                              Expanded(
                                child: Obx(
                                  () => DropdownButton<String>(
                                    value:
                                        usajiliController.kipaimara_value.value,
                                    onChanged: (newValue) {
                                      usajiliController.kipaimara_value.value =
                                          newValue!;
                                    },
                                    items: usajiliController.kipaimara_options
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 12.fSize,
                                              fontWeight: FontWeight.bold,
                                              color: appTheme.defaultcolor),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50.h,
                              ),
                              Expanded(
                                  child: Obx(
                                () => DropdownButton<String>(
                                  value: usajiliController.ndoa_value.value,
                                  onChanged: (newValue) {
                                    usajiliController.ndoa_value.value =
                                        newValue!;
                                  },
                                  items: usajiliController.ndoa_options
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            fontSize: 12.fSize,
                                            fontWeight: FontWeight.bold,
                                            color: appTheme.defaultcolor),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )),
                            ]),
                      ),

                      SizedBox(height: 25.v),
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

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // **************************************************************************************

                            Expanded(
                              child: Obx(
                                () => DropdownButton<String>(
                                  value: usajiliController.mtaa_value.value,
                                  onChanged: (newValue) {
                                    usajiliController.mtaa_value.value =
                                        newValue!;
                                  },
                                  items: usajiliController.mtaa_options
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            fontSize: 12.fSize,
                                            fontWeight: FontWeight.bold,
                                            color: appTheme.defaultcolor),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),

                            // **************************************************************************************
                            SizedBox(
                              width: 10.h,
                            ),
                            Expanded(
                                child: Obx(
                              () => DropdownButton<String>(
                                value: usajiliController.kanda_value.value,
                                onChanged: (newValue) {
                                  usajiliController.kanda_value.value =
                                      newValue!;
                                },
                                items: usajiliController.kanda_options
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 12.fSize,
                                          fontWeight: FontWeight.bold,
                                          color: appTheme.defaultcolor),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                            SizedBox(
                              width: 10.h,
                            ),

                            Expanded(
                              child: DropdownButton(
                                hint: Text(
                                  "Jumuiya",
                                  style: TextStyle(
                                      fontSize: 12.fSize,
                                      fontWeight: FontWeight.bold,
                                      color: appTheme.defaultcolor),
                                ),
                                items: usajiliController.data.map((e) {
                                  return DropdownMenuItem(
                                      child: Text(
                                        e["jina"],
                                        style: TextStyle(
                                            fontSize: 12.fSize,
                                            fontWeight: FontWeight.bold,
                                            color: appTheme.defaultcolor),
                                      ),
                                      value: e["jina"]);
                                }).toList(),
                                value: usajiliController.value,
                                onChanged: (v) {
                                  usajiliController.value = v as String;
                                  setState(() {
                                    // print(usajiliController.value);
                                    usajiliController.value = v;
                                  });
                                },
                              ),
                            ),
                          ]),

// -----------------------------------------------------------------------------------------

                      Divider(),
                      SizedBox(height: 25.v),

                      Row(
                        children: [
                          Text(
                            "Mawasiliano / Namba ya Siri",
                            style: TextStyle(
                                color: appTheme.defaultcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.fSize),
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
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
                                  controller: usajiliController.namba,
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
                            SizedBox(
                              width: 5.h,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(8)),
                                child: FormBuilderTextField(
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                  obscureText: obscurePassword,
                                  controller: usajiliController.password,
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor: appTheme.defaultcolor,
                                  name: 'password',
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    prefixIcon: InkWell(
                                      onTap: () {
                                        obscurePassword = !obscurePassword;
                                        setState(() {});
                                      },
                                      child: Icon(
                                        obscurePassword
                                            ? Icons.lock
                                            : Icons.lock_open,
                                        size: 23.fSize,
                                        color: appTheme.defaultcolor,
                                      ),
                                    ),
                                    labelText: "Namba ya Siri (Password)",
                                    labelStyle: TextStyle(
                                        color: appTheme.defaultcolor,
                                        fontSize: 12.fSize),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.v),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8)),
                        child: FormBuilderTextField(
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          obscureText: obscurePassword,
                          controller: usajiliController.password2,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: appTheme.defaultcolor,
                          name: 'password',
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            prefixIcon: InkWell(
                              onTap: () {
                                obscurePassword = !obscurePassword;
                                setState(() {});
                              },
                              child: Icon(
                                obscurePassword ? Icons.lock : Icons.lock_open,
                                size: 23.fSize,
                                color: appTheme.defaultcolor,
                              ),
                            ),
                            labelText: "Hakikisha namba ya siri (Password)",
                            labelStyle: TextStyle(
                                color: appTheme.defaultcolor,
                                fontSize: 12.fSize),
                          ),
                        ),
                      ),

                      Divider(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25.v),
              // -----------------------------------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Confirm',
                        titleStyle: TextStyle(
                            color: appTheme.defaultcolor,
                            fontSize: 18.fSize,
                            fontWeight: FontWeight.bold),
                        cancelTextColor: appTheme.defaultcolor,
                        confirmTextColor: Colors.white,
                        middleTextStyle: TextStyle(
                            color: appTheme.defaultcolor,
                            fontSize: 14.fSize,
                            fontWeight: FontWeight.bold),
                        middleText: 'Are you sure you want to Submit ?',
                        buttonColor: appTheme.defaultcolor,
                        textConfirm: 'Yes',
                        backgroundColor: Colors.white,
                        textCancel: 'No',
                        onConfirm: () {
                          usajiliController.submit();
                          //  usajiliController.formkey.currentState!.validate();
                          Get.back();
                          toastSent();
                        },
                        onCancel: () {
                          //Get.back();
                          toast();
                        },
                      );
                      //usajiliController.formkey.currentState!.save();
                      // if (usajiliController.formkey.currentState!.validate()) {

                      // }

                      // // Get.to(Register(),
                      // //     duration: Duration(milliseconds: 500),
                      // //     transition: Transition.fadeIn //transition effect
                      // //     );
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
                        'Submit',
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

  toast() {
    Fluttertoast.showToast(
        msg: "Submition Cancelled",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 14.0.fSize);
  }

  toastSent() {
    Fluttertoast.showToast(
        msg: "Submitting .......",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 14.0.fSize);
  }
}
