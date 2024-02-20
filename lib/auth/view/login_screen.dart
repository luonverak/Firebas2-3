import 'package:demo_firebase2_3/auth/controller/auth_controller.dart';
import 'package:demo_firebase2_3/auth/model/auth_model.dart';
import 'package:demo_firebase2_3/auth/view/create_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/button.dart';
import '../widget/input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool check = true.obs;
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 86, 102),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 270,
            decoration: const BoxDecoration(
              // color: Color.fromARGB(255, 66, 68, 70),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(100),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                InputField(
                  controller: emailController,
                  label: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => InputField(
                    controller: passwordController,
                    label: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        check.value = !check.value;
                      },
                      icon: Icon(
                        check.value == true
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                    ),
                    obscureText: check.value,
                  ),
                ),
                const SizedBox(height: 70),
                GestureDetector(
                  onTap: () async {
                    await authController.singInAuth(
                      AuthModel(
                        email: emailController.text,
                        password: passwordController.text.trim(),
                      ),
                    );
                  },
                  child: const ButtonClick(
                    text: 'SING IN',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 55,
                  height: 55,
                  child: Image.asset('asset/icon/google.png'),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CupertinoButton(
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              'SING UP',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        onPressed: () => Get.to(CreateAccount()),
      ),
    );
  }
}
