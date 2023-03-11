import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper{
  static late SharedPreferences sharedPreferences ;
  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future saveBoolData({required key,required value})async {
    return sharedPreferences.setBool(key, value);
  }
  static Future saveIntData({required key,required value})async {
    return sharedPreferences.setInt(key, value);
  }
  static Future saveStringData({required key,required value})async {
    return sharedPreferences.setString(key, value);
  }
  static getData({required key}){
    return sharedPreferences.get(key);
  }

  static const String _cachedCode = "cachedCode";

  static String getCachedLanguage() {
    final code = sharedPreferences.getString(_cachedCode);
    if (code != null) {
      return code;
    } else {
      return 'en';
    }
  }

  static Future<void> cacheLanguage(String code) async {
    await sharedPreferences.setString(_cachedCode, code);
  }
}