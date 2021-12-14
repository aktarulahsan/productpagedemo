import 'package:demoproject/controller/product_controller.dart';
import 'package:demoproject/view/item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: pController.productList.value.length,
            itemBuilder: (context, index) {
              return ItemView(
                itemData: pController.productList[index],
              );

              // Container(
              //   child: Text(productdata.product![index].item.toString()),
              // );
            }),
      ),
    );
  }
}
