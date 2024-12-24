class CommentsModel {
  CommentsModel({
      this.success, 
      this.message, 
      this.data,});

  CommentsModel.fromJson(dynamic json) {
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
      this.comment, 
      this.userId, 
      this.postId, 
      this.status, 
      this.user,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    comment = json['comment'];
    userId = json['user_id'];
    postId = json['post_id'];
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? id;
  String? comment;
  num? userId;
  num? postId;
  String? status;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['comment'] = comment;
    map['user_id'] = userId;
    map['post_id'] = postId;
    map['status'] = status;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.name, 
      this.profilePhoto,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    profilePhoto = json['profile_photo'];
  }
  num? id;
  String? name;
  String? profilePhoto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['profile_photo'] = profilePhoto;
    return map;
  }

}