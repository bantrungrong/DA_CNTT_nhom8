import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/app/core/values/colors.dart';
import 'package:getxapp/app/core/values/strings.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  final List<String> urls = [
    'https://classroom.google.com/?hl=fr', // URL cho item 1
    'https://dangcongsan.vn/xay-dung-dang', // URL cho item 2
    'https://dangcongsan.vn/thoi-su/tang-cuong-phong-chong-nang-nong-han-han-thieu-nuoc-xam-nhap-man-662290.html',
  ];
  @override
  Widget build(BuildContext context) {
    bool isFavorite = true;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100 - 44,
        backgroundColor: AppColors.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  padding: const EdgeInsets.only(left: 7),
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary,
                  )),
            ),
            Text(
              'Chi tiết tin tức',
              style: AppStyle.bold(color: Colors.white, fontSize: 16),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: Icon(
                    isFavorite == true
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.red,
                  )),
            ),
          ],
        ),
      ),
      body: WebViewPlus(
        initialUrl: urls[0],
        javascriptMode: JavascriptMode.disabled,
        // onWebViewCreated: (controller) {
        //   // Đây là nơi bạn có thể thực hiện các thao tác với WebView sau khi nó đã được tạo
        // },
        onPageStarted: (url) {
          // Được gọi khi trang web bắt đầu load
        },
        onPageFinished: (url) {
          // Được gọi khi trang web đã hoàn thành load
        },
        onWebResourceError: (error) {
          // Được gọi khi có lỗi xảy ra trong quá trình load trang web
        },
        // gestureNavigationEnabled: true, // Cho phép điều hướng bằng cử chỉ
        zoomEnabled: true, // Cho phép thu phóng trang web
        // Các thuộc tính khác tùy chọn có thể được thêm vào tùy theo nhu cầu của bạn
      ),
    );
  }
}
