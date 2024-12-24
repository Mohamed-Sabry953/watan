import 'package:shared_preferences/shared_preferences.dart';
class CacheData {
  static late SharedPreferences userToken;
  static late SharedPreferences userPhone;
  static late SharedPreferences userName;
  static late SharedPreferences userAddress;

  static Future<void> cacheInit() async {
    userToken = await SharedPreferences.getInstance();
    userName = await SharedPreferences.getInstance();
    userPhone = await SharedPreferences.getInstance();
    userAddress = await SharedPreferences.getInstance();

  }

  static setUserToken({required String key, required String token}) async {
    await userToken.setString(key, token);
  }
  static  getUserToken({required String key}) {
    return userToken.get(key);
  }
  static setUserPhone({required String key, required String phone}) async {
    await userPhone.setString(key, phone);
  }
  static  getUserPhone({required String key}) {
    return userPhone.get(key);
  }  static setUserAddress({required String key, required String address}) async {
    await userAddress.setString(key, address);
  }
  static  getUserAddress({required String key}) {
    return userAddress.get(key);
  }

  static  deleteUserToken({required String key}) {
    return userToken.remove(key);
  }
}