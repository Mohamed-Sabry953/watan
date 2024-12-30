class AllBoycottModel {
  AllBoycottModel({
      this.success, 
      this.message, 
      this.data,});

  AllBoycottModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.msg, 
      this.categoryDesc, 
      this.categoryPhoto, 
      this.alternatives,});

  Data.fromJson(dynamic json) {
    msg = json['msg'];
    categoryDesc = json['category_desc'];
    categoryPhoto = json['category_photo'];
    if (json['alternatives'] != null) {
      alternatives = [];
      json['alternatives'].forEach((v) {
        alternatives?.add(Alternatives.fromJson(v));
      });
    }
  }
  String? msg;
  String? categoryDesc;
  String? categoryPhoto;
  List<Alternatives>? alternatives;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    map['category_desc'] = categoryDesc;
    map['category_photo'] = categoryPhoto;
    if (alternatives != null) {
      map['alternatives'] = alternatives?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Alternatives {
  Alternatives({
      this.productName, 
      this.productPrice, 
      this.productImage,});

  Alternatives.fromJson(dynamic json) {
    productName = json['product_name'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
  }
  String? productName;
  String? productPrice;
  String? productImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_name'] = productName;
    map['product_price'] = productPrice;
    map['product_image'] = productImage;
    return map;
  }

}