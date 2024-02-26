import 'package:demo_firebase2_3/home/model/product_model.dart';
import 'package:demo_firebase2_3/home/service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> listProdcut = <ProductModel>[].obs;
  RxBool loading = true.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future getData() async {
    try {
      var product = await ServiceProductAPI().fetchProductAPI();
      if (product != null) {
        listProdcut.value = product;
      }
      loading(true);
    } finally {
      loading(false);
    }
  }
}
