import 'package:demo_firebase2_3/auth/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/input_field.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cf_passwordController = TextEditingController();
  RxBool check = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 86, 102),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    const Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
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
                  const SizedBox(height: 20),
                  Obx(
                    () => InputField(
                      controller: cf_passwordController,
                      label: ' Confirm Password',
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
                  const ButtonClick(
                    text: 'SING UP',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
