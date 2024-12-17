class PostsModel {
  PostsModel({
      this.success, 
      this.message, 
      this.data,});

  PostsModel.fromJson(dynamic json) {
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
      this.title, 
      this.content, 
      this.status, 
      this.media, 
      this.userId, 
      this.user,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    status = json['status'];
    media = json['media'] != null ? json['media'].cast<String>() : [];
    userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? id;
  String? title;
  String? content;
  String? status;
  List<String>? media;
  num? userId;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['status'] = status;
    map['media'] = media;
    map['user_id'] = userId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.profilePhoto,});

  User.fromJson(dynamic json) {
    id = json['id'];
    profilePhoto = json['profile_photo'];
  }
  num? id;
  String? profilePhoto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['profile_photo'] = profilePhoto;
    return map;
  }

}