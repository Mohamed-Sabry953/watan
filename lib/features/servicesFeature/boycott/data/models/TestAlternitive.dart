class TestAlternitive {
  TestAlternitive({
      this.success, 
      this.message, 
      this.data,});

  TestAlternitive.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.desc, 
      this.code, 
      this.categoryPhoto, 
      this.categoryType,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    code = json['code'];
    categoryPhoto = json['category_photo'];
    categoryType = json['category_type'];
  }
  num? id;
  String? name;
  String? desc;
  String? code;
  String? categoryPhoto;
  String? categoryType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['desc'] = desc;
    map['code'] = code;
    map['category_photo'] = categoryPhoto;
    map['category_type'] = categoryType;
    return map;
  }

}