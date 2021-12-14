// To parse this JSON data, do
//
//     final readerPostResponseNew = readerPostResponseNewFromJson(jsonString);

import 'dart:convert';

ReaderPostResponseNew readerPostResponseNewFromJson(String str) => ReaderPostResponseNew.fromJson(json.decode(str));

String readerPostResponseNewToJson(ReaderPostResponseNew data) => json.encode(data.toJson());

class ReaderPostResponseNew {
    ReaderPostResponseNew({
        this.status,
        this.product,
    });

    String? status;
    List<Product>? product;

    factory ReaderPostResponseNew.fromJson(Map<String, dynamic> json) => ReaderPostResponseNew(
        status: json["status"],
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "product": List<dynamic>.from(product!.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.item,
        this.details,
        this.detailList,
        this.productImage,
    });

    String? item;
    String? details;
    List<DetailList>? detailList;
    List<ProductImage>? productImage;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        item: json["item"],
        details: json["details"],
        detailList: List<DetailList>.from(json["detailList"].map((x) => DetailList.fromJson(x))),
        productImage: List<ProductImage>.from(json["productImage"].map((x) => ProductImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "item": item,
        "details": details,
        "detailList": List<dynamic>.from(detailList!.map((x) => x.toJson())),
        "productImage": List<dynamic>.from(productImage!.map((x) => x.toJson())),
    };
}

class DetailList {
    DetailList({
        this.color,
        this.size,
        this.price,
    });

    String? color;
    String? size;
    String? price;

    factory DetailList.fromJson(Map<String, dynamic> json) => DetailList(
        color: json["color"],
        size: json["size"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "size": size,
        "price": price,
    };
}

class ProductImage {
    ProductImage({
        this.color,
        this.pimage,
    });

    String? color;
    String? pimage;

    factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        color: json["color"],
        pimage: json["pimage"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "pimage": pimage,
    };
}
