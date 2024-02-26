import 'package:demo_firebase2_3/auth/controller/auth_controller.dart';
import 'package:demo_firebase2_3/home/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final authController = Get.put(AuthController());
  final user = FirebaseAuth.instance.currentUser;
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
        actions: [
          IconButton(
            onPressed: () => authController.signOutUser(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(
        () => Visibility(
          visible: productController.loading.value,
          replacement: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.6,
              children: List.generate(
                productController.listProdcut.length,
                (index) => item(
                  productController.listProdcut[index],
                ),
              ),
            ),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget item(ProductModel productModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Color.fromARGB(255, 231, 231, 231),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 170,
            child: Image.network(
              productModel.image,
            ),
          ),
          Text(
            productModel.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
