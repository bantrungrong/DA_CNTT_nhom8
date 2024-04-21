import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getxapp/app/core/values/strings.dart';
import 'package:getxapp/app/screen/event_screen/event_screen.dart';
import 'package:getxapp/app/screen/product/product.dart';

class HomePageScreenLogined extends StatefulWidget {
  const HomePageScreenLogined({super.key});

  @override
  State<HomePageScreenLogined> createState() => _HomePageScreenLoginedState();
}

class _HomePageScreenLoginedState extends State<HomePageScreenLogined> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Get.height * 0.1,
        backgroundColor: Colors.red,
        title: Row(children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyễn Văn A',
                      style: AppStyle.bold(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      'Công ty nước giải khát X',
                      style: AppStyle.bold(fontSize: 13, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Text(
            'Danh mục',
            style: AppStyle.bold(
              fontSize: 18,
            ),
          ),
        ),
        Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(const EventScreen());
                  },
                  child: _buildCell('Tin tức Đại lý')),
              GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, ProductScreen() );
                    Get.to(const ProductScreen());
                  },
                  child: _buildCell('Quản lý danh mục sản phẩm')),
              _buildCell('Quản lý thông tin đại lý'),
              _buildCell('Thông báo nội bộ'),
              _buildCell('Văn kiện tư liệu'),
              _buildCell(''),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCell(String data) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2), // changes the direction of shadow
          ),
        ],
      ),
      child: Column(children: [
        Text(
          data,
          style: AppStyle.bold(fontSize: 16, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
