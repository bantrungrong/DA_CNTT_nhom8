import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getxapp/app/core/values/colors.dart';
import 'package:getxapp/app/core/values/strings.dart';
import 'package:getxapp/app/data/models/user.dart';
import 'package:getxapp/app/data/providers/api_provider.dart';
import 'package:getxapp/app/widget/button.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [_buildBody(context)],
      ),
    );
  }

  validateUser() async {
    try {
      var res = await http.post(Uri.parse(API.validateEmail), body: {
        'user_email': email.text.trim(),
      });
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (resBody['emailFound']) {
          Fluttertoast.showToast(msg: 'try another email');
        } else {
          saveUser();
        }
      }
    } catch (e) {}
  }

  saveUser() async {
    User userModel =
        User(1, name.text.trim(), email.text.trim(), password.text.trim());
    try {
      var res =
          await http.post(Uri.parse(API.signUp), body: userModel.toJson());
      if (res.statusCode == 200) {
        var resBodySignUp = jsonDecode(res.body);
        if (resBodySignUp['success'] == true) {
          Fluttertoast.showToast(msg: 'đăng kí thành công');
        } else {
          Fluttertoast.showToast(msg: 'đăng kí thất bại');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                const Gap(132),
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
                _buildTextFieldEmail(),
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
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    onPressed: () {
                      validateUser();
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Đăng ký',
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
                  onTap: () {
                    // if(formKey.currentState!.validate()){
                    //   validateUser();
                    // }

                    // Get.to(HomePageScreenLogined());
                  },
                  child: ButtonApp(
                      height: 50,
                      width: Get.width * 0.9,
                      title: 'Đăng nhập',
                      color: Colors.red,
                      colorTitle: Colors.white),
                )
              ],
            ),
            const Gap(24)
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
            controller: name,
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

  Widget _buildTextFieldEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: AppStyle.medium(
            fontSize: 14,
          ),
        ),
        const Gap(8),
        SizedBox(
          width: MediaQuery.of(context).size.height,
          child: TextFormField(
            controller: email,
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
    bool passwordVisible = false;
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
            controller: password,
            readOnly: false,
            maxLines: 1,
            obscureText: !passwordVisible,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: IconButton(
                  icon: Icon(
                    !passwordVisible
                        ? Icons.visibility_outlined
                        // ignore: dead_code
                        : Icons.visibility_off_outlined,
                    color: Colors.grey.shade700,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                )),
          ),
        )
      ],
    );
  }
}
