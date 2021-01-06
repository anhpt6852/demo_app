import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/productcontroller.dart';
import 'package:shopping_app/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Shopee',
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.grid_view), onPressed: null),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (productController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return StaggeredGridView.countBuilder(
                      crossAxisCount: 10,
                      itemCount: productController.productList.length,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductTile(
                            productController.productList[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1));
              },
            ),
          ),
        ],
      ),
    );
  }
}
