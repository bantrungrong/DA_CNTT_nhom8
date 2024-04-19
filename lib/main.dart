

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxapp/app/data/services/services.dart';
import 'package:getxapp/app/modules/home/home_bindings.dart';
import 'package:getxapp/app/modules/home/home_view.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }
void main ()async{
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp (const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
debugShowCheckedModeBanner: false,
      home:  const HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
