import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/app/data/services/storage/reponsitory.dart';

import '../../data/models/task.dart';

class HomeController extends GetxController {
  TaskReponsitory taskReponsitory;

  HomeController({required this.taskReponsitory});
  final formKey = GlobalKey<FormState>();
  final tasks = <Task>[].obs;
  final editCtrl = TextEditingController();
  final chipIndex = 0.obs;
  final deleting = false.obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskReponsitory.readTask());
    ever(tasks, (_) => taskReponsitory.writeTask(tasks));
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  void onclose() {
    editCtrl.dispose();
    super.onClose();
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }
}
