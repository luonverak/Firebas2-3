import 'package:demo_firebase2_3/auth/model/auth_model.dart';
import 'package:demo_firebase2_3/home/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/login_screen.dart';

class AuthController extends GetxController {
  RxBool loading = true.obs;
  @override
  void onInit() {
    onCheckUser();
    super.onInit();
  }

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
        Get.offAll(HomeScreen());
        Get.snackbar(
          'Success',
          'Account login success',
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

  Future<void> onCheckUser() async {
    await Future.delayed(const Duration(seconds: 3));
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          Get.offAll(LoginScreen());
        } else {
          Get.offAll(HomeScreen());
        }
      },
    );
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
