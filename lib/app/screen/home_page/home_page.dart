import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/app/core/values/strings.dart';
import 'package:getxapp/app/screen/event_screen/event_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBodyContent(),
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
                    Get.to(EventScreen());
                  },
                  child: _buildCell('Tin tức Đại lý')),
              GestureDetector(
                  onTap: () {}, child: _buildCell('Quản lý danh mục sản phẩm')),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2), // changes the direction of shadow
          ),
        ],
      ),
      child: Column(children: [
        Text(
          data,
          style: AppStyle.bold(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
