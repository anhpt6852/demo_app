import 'package:get/state_manager.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();

      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
