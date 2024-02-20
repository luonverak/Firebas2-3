import 'package:demo_firebase2_3/auth/model/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Future signUpAuth(AuthModel authModel) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password.trim(),
      );
      if (credential.user != null) {
        Get.snackbar(
          'Success',
          'Account create success',
          colorText: Colors.white,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Invalid',
          'The password provided is too weak.',
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Invalid',
          'The account already exists for that email.',
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Invalid',
          'Something wrong.',
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  Future singInAuth(AuthModel authModel) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      if (credential.user != null) {
        Get.snackbar(
          'Success',
          'Account login success',
          colorText: Colors.white,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Invalid',
          'Something wrong.',
          colorText: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Invalid',
          'Something wrong.',
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Invalid',
          'Something wrong.',
          colorText: Colors.white,
        );
      }
    }
    update();
  }
}
