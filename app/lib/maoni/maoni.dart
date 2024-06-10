import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/maoni/maoni_controller.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Maoni extends StatefulWidget {
  @override
  State<Maoni> createState() => _Maoni();
}

class _Maoni extends State<Maoni> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  MaoniController maoni_Controller = MaoniController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sanduku la Maoni / Ushauri",
          style: TextStyle(fontSize: 14.fSize),
        ),
        centerTitle: true,
        backgroundColor: appTheme.defaultcolor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15.v,
            ),
            FormBuilder(
              key: _fbKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.15),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: appTheme.defaultcolor)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.h, right: 8.h),
                        child: SizedBox(
                          height: 2 * 50.0,
                          child: FormBuilderTextField(
                            maxLines: 10,
                            maxLength: 150,
                            cursorHeight: 25.v,
                            controller: maoni_Controller.maoniTextfield,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxWordsCount(150)
                            ]),
                            keyboardType: TextInputType.multiline,
                            cursorColor: appTheme.defaultcolor,
                            name: 'maoni',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.15)),
                              ),
                              labelText: "Toa maoni yako",
                              labelStyle: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize),
                            ),
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
                        maoni_Controller.submit();
                      }
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
