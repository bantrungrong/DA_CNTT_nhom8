

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:getxapp/app/core/utils/extension.dart';
import 'package:getxapp/app/data/models/task.dart';
import 'package:getxapp/app/modules/home/home_controller.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TaskCard extends StatelessWidget {
  final homeCrtl = Get.find<HomeController>();
  final Task task;
   TaskCard({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    final squareWidth = Get.width - 12.0.wp;
    // final color = ColorToHex(task.color);
    final color = HexColor(task.color);

    return Container(
      width: squareWidth/2,
      height: squareWidth/2,
      margin: EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 7,
            offset: const Offset(0, 7),
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const StepProgressIndicator(
            totalSteps: 100,
            currentStep: 80,
            size: 5,
            padding: 0,
            selectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white ,Colors.blue],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Icon(IconData(task.icon,fontFamily: 'MaterialIcons'),
                color: color,
              ),
          ),
          Padding(padding: EdgeInsets.all(6.0.wp),
          child: Column(
            children: [
              Text(task.title,style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 12.0.sp),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10,),
              Text("${task.todos?.length ?? 0} Task",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )
              )
            ],
          ),
          )
        ],
      ),
    );
  }
}
