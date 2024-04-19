
import 'package:get/get.dart';
import 'package:getxapp/app/data/providers/task/provider.dart';
import 'package:getxapp/app/modules/home/home_controller.dart';

import '../../data/services/storage/reponsitory.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut(() => HomeController(
        taskReponsitory: TaskReponsitory(
          taskProvider: TaskProvider()
        ),

    ));
  }
}