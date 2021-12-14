import 'package:demoproject/controller/product_controller.dart';
import 'package:demoproject/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailss extends StatelessWidget {
  final pController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" ${pController.selectedProduct.value.item} Details"),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.all(5),
          child: ListView(
            children: [
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() {
                    return pController.selectImage.value != null
                        ? Image.asset(
                            pController.selectImage.value.pimage.toString(),
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                            matchTextDirection: false,
                          )
                        : const Text("now Image");
                  })),
              Obx(() {
                return Container(
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      pController.selectPrice.value.toString() + "/-",
                      style: const TextStyle(
                          fontFamily: 'TTCommonsd',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ));
              }),
              Container(
                height: 40,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: pController.colorList.length,
                    itemBuilder: (context, index) {
                      return showcolor(pController.colorList[index].toString());
                    }),
              ),
              Container(
                height: 40,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: pController.sizeList.length,
                    itemBuilder: (context, index) {
                      return showsize(
                          pController.sizeList.value[index].toString());
                    }),
              ),
              Text(pController.selectedProduct.value.item.toString()),
              Text(pController.selectedProduct.value.details.toString()),
              Container(
                height: 80,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: pController.productImageList.length,
                    itemBuilder: (context, index) {
                      return showImage(pController.productImageList[index]);
                    }),
              )
            ],
          ),
        )

        //  SingleChildScrollView(
        //   child: ListView(
        //     shrinkWrap: true,
        //     scrollDirection: Axis.vertical,
        //     children: [
        //       Container(
        //         height: 200,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Image.asset(
        //           product.productImage![0].pimage.toString(),
        //           alignment: Alignment.center,
        //           fit: BoxFit.scaleDown,
        //           matchTextDirection: false,
        //         ),
        //       ),
        //       Text(product.item.toString()),
        //       Text(product.details.toString()),
        //       Container(
        //         child: ListView.builder(
        //             shrinkWrap: true,
        //             scrollDirection: Axis.horizontal,
        //             itemCount: product.productImage!.length,
        //             itemBuilder: (context, index) {
        //               return showImage(product.productImage![index]);
        //             }),
        //       )
        //     ],
        //   ),
        // ),

        );
  }

  Widget showImage(ProductImage? productImage) {
    ProductImage pimage = productImage!;
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      width: 50,
      child: InkWell(
          onTap: () {
            pController.selectImage.value = pimage;
          },
          child: Image.asset(pimage.pimage.toString())),
    );
  }

  Widget showcolor(var productcolor) {
    // print(productcolor.toString());
    return Obx(() {
      return Container(
        height: 20,
        width: 50,
        color:
            productcolor.toString() == pController.selectColor.value.toString()
                ? Colors.black26
                : Colors.white,
        margin: const EdgeInsets.all(5),
        child: InkWell(
            onTap: () {
              pController.selectColor.value = productcolor;
              pController.viewPrice();
            },
            child: Text(productcolor)),
      );
    });
  }

  Widget showsize(var productSize) {
    print(productSize.toString());
    return Obx(() {
      return Container(
        height: 20,
        width: 50,
        color: productSize.toString() == pController.selectSize.value.toString()
            ? Colors.black26
            : Colors.white,
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: InkWell(
            onTap: () {
              pController.selectSize.value = productSize;
              pController.viewPrice();
            },
            child: Text(productSize)),
      );
    });
  }

  // Widget showColor() {
  //   return DropdownButton<String>(
  //     value: pController.selectColor.value,
  //     icon: const Icon(Icons.arrow_downward),
  //     elevation: 16,
  //     style: const TextStyle(color: Colors.deepPurple),
  //     underline: Container(
  //       height: 2,
  //       color: Colors.deepPurpleAccent,
  //     ),
  //     onChanged: (String? newValue) {

  //     },
  //     items: pController.colorList.value.map((location) {
  //             return DropdownMenuItem(
  //               child: Text(location),
  //               value: location,
  //             );
  //           })
  //   );
  // }
}
