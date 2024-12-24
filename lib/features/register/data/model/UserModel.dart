class UserModel {
  UserModel({
      this.user,});

  UserModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.name, 
      this.email, 
      this.photo,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
  }
  String? name;
  String? email;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['photo'] = photo;
    return map;
  }

}