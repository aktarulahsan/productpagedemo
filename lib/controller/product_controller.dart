import 'package:demoproject/model/product_model.dart';
import 'package:demoproject/product_detailss.dart';
import 'package:get/get.dart';
import 'package:darq/darq.dart';

class ProductController extends GetxController {
  var productList = [].obs;
  var selectedProduct = Product().obs;
  var productImageList = <ProductImage>[].obs;
  var pdetailList = <DetailList>[].obs;
  var selectImage = ProductImage().obs;
  var colorList = [].obs;
  var sizeList = [].obs;
  var priceList = [].obs;

  var selectColor = ''.obs;
  var selectSize = ''.obs;
  var selectPrice = ''.obs;

  ReaderPostResponseNew productdata = ReaderPostResponseNew.fromJson({
    "status": "ok",
    "product": [
      {
        "item": "Floral Alphabet Letters A-Z White Color T-Shirt",
        "details":
            "This t-shirt is comfortable and can worn for regular use. It is a perfect wear for men like you. You will love to wear this luxurious and colorful shirt just for its versatile usability and diversified fashion sense. ",
        "detailList": [
          {"color": "White", "size": "Small", "price": "500"},
          {"color": "White", "size": "Large", "price": "600"},
          {"color": "Black", "size": "Small", "price": "400"},
          {"color": "Black", "size": "Large", "price": "550"}
        ],
        "productImage": [
          {"color": "Black", "pimage": "assets/images/blackshirt.jpg"},
          {"color": "White", "pimage": "assets/images/redtshirt.jpg"}
        ]
      },
      {
        "item": "MENS CASUAL TWILL/CHINO PANT",
        "details":
            "Our company desires to purchase Casual Pant. Material should be 100% cotton. We are looking in all size like 30 to 40. We would like to purchase from India and Bangladesh.",
        "detailList": [
          {"color": "White", "size": "Small", "price": "400"},
          {"color": "White", "size": "Large", "price": "450"},
          {"color": "Black", "size": "Small", "price": "400"},
          {"color": "Black", "size": "Large", "price": "550"}
        ],
        "productImage": [
          {"color": "Black", "pimage": "assets/images/pant.jpg"},
          {"color": "White", "pimage": "assets/images/pantt.jpg"}
        ]
      }
    ]
  });

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() {
    productList.value = productdata.product!;
  }

  void selectProduct(var item) {
    selectedProduct.value = item;
    productImageList.value = selectedProduct.value.productImage!;
    if (productImageList.isNotEmpty) {
      selectImage.value = productImageList[0];
    }
    pdetailList.value = selectedProduct.value.detailList!;

    // var colorList = pdetailList.value.toSet().toList();
    // print(colorList);ss///

    List<DetailList> pDList = pdetailList.toSet().toList();
  
    var slist =[];
    var clist =[];
    pdetailList.value.groupBy((pet){
    clist.add(pet.color);
    slist.add(pet.size);
    }).toList();


    sizeList.value = slist.toSet().toList();
    colorList.value = clist.toSet().toList();

    if (colorList.isNotEmpty) {
      selectColor.value = colorList[0].toString();
    }
    if (sizeList.isNotEmpty) {
      selectSize.value = sizeList[0].toString();
    }
    if (pdetailList.isNotEmpty) {
      selectPrice.value = pdetailList[0].price.toString();
    }

    Get.to(ProductDetailss());
  }

  void viewPrice( ){
      for (var item in pdetailList.value) {
          if(item.color == selectColor.value && item.size==selectSize.value ){
            selectPrice.value = item.price.toString();
            print(selectPrice.value.toString());
          }
      }
  }

}
