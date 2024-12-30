class TestCodeModel {
  TestCodeModel({
      this.success, 
      this.message, 
      this.data,});

  TestCodeModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data']=="هذا المنتج ليس في المقاطعه"?{
      "data":"هذا المنتج ليس في المقاطعه"
    }:json['data'];
  }
  bool? success;
  String? message;
  Map<String, dynamic>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}