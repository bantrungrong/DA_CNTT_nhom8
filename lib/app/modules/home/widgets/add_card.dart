
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getxapp/app/core/utils/extension.dart';
import 'package:getxapp/app/widget/icon.dart';

import '../../../core/values/colors.dart';
import '../../../data/models/task.dart';
import '../home_controller.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
   AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth/2,
      height: squareWidth/2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: "task type",
            content: Form(
              key: homeCtrl.formKey,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      controller: homeCtrl.editCtrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "title ",

                      ),
                      validator: (value){
                        if(value==null || value.trim().isEmpty){
                          return "Nhập văn bản bạn vào đây";
                        }return null;
                      },
                    ),
                  ),
                  Wrap(
                    spacing: 2.0.wp,
                    children: IconHelper().GetIcons().map((e) => Obx(() {
                      final index = IconHelper().GetIcons().indexOf(e);
                      return ChoiceChip(label: e, selected: homeCtrl.chipIndex.value == index,onSelected: (bool selected){
                        homeCtrl.chipIndex.value = selected
                            ? index
                            : 0;
                      },);
                    })).toList(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                      minimumSize: const Size(150, 40)
                    ),
                    onPressed: (){
                      if(homeCtrl.formKey.currentState!.validate()){
                        int icon = IconHelper().GetIcons()[homeCtrl.chipIndex.value].icon!.codePoint;
                        String color = IconHelper().GetIcons()[homeCtrl.chipIndex.value].color!.toHex();
                        var task = Task (
                          title: homeCtrl.editCtrl.text,
                          icon:icon,
                          color:color
                        );
                        Get.back();
                        homeCtrl.addTask(task) ?
                            EasyLoading.showSuccess("Create success"):EasyLoading.showError("Create fail");
                      }
                    },
                    child: const Text("Confirm"),
                  ),
                ],
              ),
            )
          );
          homeCtrl.editCtrl.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: const [8,4],
          child: Center(
            child: Icon(Icons.add,size: 10.0.wp,color: Colors.grey,),

          ),
        ),
      ),
    );
  }
}
