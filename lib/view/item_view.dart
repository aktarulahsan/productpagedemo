import 'package:demoproject/controller/product_controller.dart';
import 'package:demoproject/model/product_model.dart';
 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemView extends StatelessWidget {
  ItemView({
    Key? key,
    this.itemData,
  }) : super(key: key);
  Product? itemData;

  @override
  Widget build(BuildContext context) {
    final pController = Get.put(ProductController());
    List<ProductImage>? imagelist = itemData!.productImage;

    return Container(
      height: 255,
      width: 180,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ProductDetails(
          //               product: itemData,
          //             )));
          // pcon
          // Get.to(ProductDetails(
          //   product: itemData,
          // ));
          pController.selectProduct(itemData);
        },
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 30,
                child: Container(
                  // height: MediaQuery.of(context).size.height / 8,
                  // width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                      matchTextDirection: false,
                      image: AssetImage(imagelist![0].pimage.toString()),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                )),
            const Positioned(bottom: 28, left: 10, right: 10, child: Divider()),
          ],
        ),
      ),
    );
  }
}
