// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/core/utils/size_utils.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.defaultcolor,
        foregroundColor: Colors.white,
        title: Text(
          "Register",
          style: TextStyle(
            fontSize: 16.fSize,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: <Widget>[
                FormBuilder(
                  key: _fbKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      FormBuilderDateTimePicker(
                        name: "date",
                        inputType: InputType.date,
                        format: DateFormat("yyyy-MM-dd"),
                        decoration:
                            InputDecoration(labelText: "Appointment Time"),
                      ),
                      FormBuilderSlider(
                        name: "slider",
                        //validator: [FormBuilderValidators.min(6)],
                        min: 0.0,
                        max: 10.0,
                        initialValue: 1.0,
                        divisions: 20,
                        decoration:
                            InputDecoration(labelText: "Number of somethings"),
                      ),
                      FormBuilderCheckbox(
                        name: 'accept_terms',
                        initialValue: true,
                        title: Text("uuuuuuu"),

                        //validator:
                      ),
                      FormBuilderDropdown(
                        name: "gender",
                        decoration: InputDecoration(labelText: "Gender"),
                        initialValue: 'Male',
                        //validator: [FormBuilderValidators.required()],
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                                value: gender, child: Text("$gender")))
                            .toList(),
                      ),
                      FormBuilderTextField(
                        name: 'password',
                        autovalidateMode: AutovalidateMode.always,

                        decoration: InputDecoration(labelText: "Full name"),
                        // validator: [
                        //   FormBuilderValidators.numeric(),
                        //   FormBuilderValidators.max(70),
                        // ],
                      ),
                      FormBuilderRadioGroup(
                        decoration:
                            InputDecoration(labelText: 'My chosen language'),
                        // leadingInput: true,
                        name: "best_language",
                        // validators: [FormBuilderValidators.required()],
                        options: [
                          "Dart",
                          "Kotlin",
                          "Java",
                          "Swift",
                          "Objective-C"
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderSwitch(
                        title: Text('I Accept the tems and conditions'),
                        name: "accept_terms_switch",
                        initialValue: true,
                      ),
                      FormBuilderCheckboxGroup(
                        decoration: InputDecoration(
                            labelText: "The language of my people"),
                        name: "languages",
                        initialValue: ["Dart"],
                        options: [
                          FormBuilderFieldOption(value: "Dart"),
                          FormBuilderFieldOption(value: "Kotlin"),
                          FormBuilderFieldOption(value: "Java"),
                          FormBuilderFieldOption(value: "Swift"),
                          FormBuilderFieldOption(value: "Objective-C"),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Text("Submit"),
                      onPressed: () {
                        _fbKey.currentState!.save();
                        if (_fbKey.currentState!.validate()) {
                          print(_fbKey.currentState!.value);
                        }
                      },
                    ),
                    MaterialButton(
                      child: Text("Reset"),
                      onPressed: () {
                        // _fbKey.currentState.reset();
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
