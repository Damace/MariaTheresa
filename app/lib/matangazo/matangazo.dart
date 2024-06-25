// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen_controller.dart';
import 'package:app/matangazo/matangazo_controller.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:permission_handler/permission_handler.dart';

class Matanga_zo extends StatefulWidget {
  @override
  State<Matanga_zo> createState() => _Matanga_zo();
}

class _Matanga_zo extends State<Matanga_zo> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  MatangazoController dataController = Get.put(MatangazoController());

  @override
  void initState() {
    super.initState();
    dataController.fetchMatangazo();
    dataController.fetchMatangazo_file();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    final catego = Get.arguments['category'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.defaultcolor,
        foregroundColor: Colors.white,
        title: Text(
          "Matangazo ya ${catego}",
          style: TextStyle(
            fontSize: 16.fSize,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                matangazo_mengine(context);
              },
              icon: const Icon(Icons.list))
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => dataController.matangazoList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: dataController.matangazoList.length,
                        itemBuilder: (context, index) {
                          TextEditingController tangazoTextfield =
                              TextEditingController(
                            text: dataController.matangazoList[index].maelezo,
                          );

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${dataController.matangazoList[index].dominika}.",
                                      style: TextStyle(
                                          fontSize: 12.fSize,
                                          fontWeight: FontWeight.bold,
                                          color: appTheme.defaultcolor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 250.v,
                                decoration: BoxDecoration(
                                  color: appTheme.defaultcolor.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 2.h, right: 2.h),
                                  child: SizedBox(
                                    height: 2 * 50.0,
                                    child: FormBuilderTextField(
                                      style: TextStyle(
                                          fontSize: 14.fSize,
                                          color: appTheme.defaultcolor),
                                      textAlign: TextAlign.start,
                                      readOnly: true,
                                      maxLines: 1000,
                                      controller: tangazoTextfield,
                                      cursorColor: appTheme.defaultcolor,
                                      name: '',
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("",
                                        style: TextStyle(
                                            fontSize: 14.fSize,
                                            color: appTheme.defaultcolor)),
                                    SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100.v),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BounceInUp(
                              child: GFLoader(
                                  size: GFSize.SMALL,
                                  loaderstrokeWidth: 2,
                                  type: GFLoaderType.ios),
                            ),
                            Text(
                              "Subiri kidogo ...",
                              style: TextStyle(
                                  fontSize: 11.5.fSize,
                                  color: appTheme.defaultcolor,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  matangazo_mengine(BuildContext context) {
    HomeController dataController = Get.put(HomeController());
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: false,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          bottom: 0,
          top: 8,
        ),
        child: Container(
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10.v,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: appTheme.defaultcolor,
                        boxShadow: [
                          BoxShadow(
                            color: appTheme.defaultcolor,
                            blurRadius: 3,
                          ),
                        ]),
                    child: Text("                              "),
                  ),
                ],
              ),
              Card(
                elevation: 0,
                child: Container(
                  height: 40.v,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.church,
                          size: 16.fSize,
                        ),
                        SizedBox(
                          width: 15.h,
                        ),
                        Text(
                          "Matangazo mengine ya Dominika",
                          style: TextStyle(
                            fontSize: 12.fSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.06),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => dataController.matangazofile.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          //shrinkWrap: true,
                          itemCount: dataController.matangazofile.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: const Icon(
                                  FontAwesomeIcons.filePdf,
                                  color: Colors.red,
                                  size: 16,
                                ),
                                trailing: dataController.progress != null
                                    ? CircularProgressIndicator()
                                    : InkWell(
                                        onTap: () {
                                          Get.back();
                                          downloadfile(
                                              dataController
                                                  .matangazofile[index].file
                                                  .toString(),
                                              dataController
                                                  .matangazofile[index].dominika
                                                  .toString());
                                        },
                                        child: Icon(
                                          FontAwesomeIcons.download,
                                          color: appTheme.defaultcolor,
                                          size: 25.fSize,
                                        ),
                                      ),
                                title: Text(
                                  "${dataController.matangazofile[index].dominika}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.fSize,
                                      color: appTheme.defaultcolor,
                                      fontWeight: FontWeight.bold),
                                ));
                          },
                        ),
                      )
                    : BounceInUp(
                        child: GFLoader(
                            size: GFSize.SMALL,
                            loaderstrokeWidth: 2,
                            type: GFLoaderType.ios),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void downloadfile(String myFile, String name) async {
    var status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      FileDownloader.downloadFile(
          url: myFile,
          name: name,
          onProgress: (String? filename, double process) {
            Fluttertoast.showToast(
                msg: "Downloading.... ${process}%",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0);

            //  print("FILE $filename HAS PROGRESS $process");
          },
          onDownloadCompleted: (String path) {
            Fluttertoast.showToast(
                msg: "Downloading Completed",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          onDownloadError: (String error) {
            print("DOWNLOAD ERROR $error");
          });
    } else {
      print("Permission is not granted");
    }
  }
}
