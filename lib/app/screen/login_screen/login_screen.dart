import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getxapp/app/core/values/colors.dart';
import 'package:getxapp/app/core/values/strings.dart';
import 'package:getxapp/app/screen/home_page/home_page_logined.dart';
import 'package:getxapp/app/widget/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<Map<String, String>> users = [
    {'username': '', 'password': ''},
    {'username': '', 'password': ''},
    {'username': '', 'password': ''},
  ];
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> _login(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    // Kiểm tra xem tên người dùng và mật khẩu có trong danh sách không
    bool isValidUser = false;
    for (var user in users) {
      if (user['username'] == username && user['password'] == password) {
        isValidUser = true;
        break;
      }
    }

    if (isValidUser) {
      showDialog(
        context: context,
        barrierDismissible: false, // prevent dismissing by tapping outside
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text('Đang đăng nhập...'),
            ],
          ),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context); // Close loading dialog
      Get.to(HomePageScreenLogined());
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          insetPadding: const EdgeInsets.all(10),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Text(
                  'Đăng nhập không thành công',
                  style: AppStyle.bold(fontSize: 16),
                ),
                Text(
                  'Tên người dùng hoặc mật khẩu không chính xác',
                  textAlign: TextAlign.center,
                  style: AppStyle.regular(fontSize: 16),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 36,
                        width: 36,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.primary,
                        )),
                  ),
                  Gap(132),
                  const Text(
                    'Đăng nhập',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  Text(
                    'Vui lòng đăng nhập tài khoản để tiếp tục',
                    style: AppStyle.regular(fontSize: 14, color: Colors.grey),
                  ),
                  const Gap(20),
                  _buildTextFieldUserName(),
                  const Gap(10),
                  _buildTextFieldPassword(),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () {},
                      child: RichText(
                        text: const TextSpan(
                          text: 'Quên mật khẩu',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ]),
                  GestureDetector(
                    onTap: () => _login(context),
                    child: ButtonApp(
                        height: 50,
                        width: Get.width * 0.9,
                        title: 'Đăng nhập',
                        color: Colors.red,
                        colorTitle: Colors.white),
                  )
                ],
              ),
            ),
            Gap(24)
          ]),
    );
  }

  Widget _buildTextFieldUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tên đăng nhập',
          style: AppStyle.medium(
            fontSize: 14,
          ),
        ),
        const Gap(8),
        SizedBox(
          width: MediaQuery.of(context).size.height,
          child: TextFormField(
            controller: usernameController,
            readOnly: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              errorStyle: TextStyle(height: 0),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextFieldPassword() {
    bool _passwordVisible = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mật khẩu ',
          style: AppStyle.medium(
            fontSize: 14,
          ),
        ),
        const Gap(8),
        SizedBox(
          width: MediaQuery.of(context).size.height,
          child: TextFormField(
            controller: passwordController,
            readOnly: false,
            maxLines: 1,
            obscureText: !_passwordVisible,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: IconButton(
                  icon: Icon(
                    !_passwordVisible
                        ? Icons.visibility_outlined
                        // ignore: dead_code
                        : Icons.visibility_off_outlined,
                    color: Colors.grey.shade700,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )),
          ),
        )
      ],
    );
  }
}
