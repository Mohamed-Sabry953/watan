/// success : "You registered successfully"
/// access_token : "1RFFixxsZ51CtPpHDT8EfwfHSDm4Km7SQne7hDZvNGKvyxPD0VKR5F9Ux2TSskwu"
/// msg : "الرجاء حفظ هذا الكود او الاحتفاظ به لانك سوف تحتاج الي استخدامه في حاله اردت تعديل الباسورد الخاص بك:5833248"

class RegisterDataModel {
  RegisterDataModel({
      required String success,
      required String accessToken,
      required String msg,})
  {
    success = success;
    accessToken = accessToken;
    msg = msg;
}

  RegisterDataModel.fromJson(dynamic json) {
    success = json['success'];
    accessToken = json['access_token'];
    msg = json['msg'];
  }
  bool? success;
  String? accessToken;
  String? msg;

}