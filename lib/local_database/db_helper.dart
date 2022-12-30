
import 'package:shared_preferences/shared_preferences.dart';

import '../utlis/constent.dart';


class MyPrefs {
  SharedPreferences? preferences;

  static Future<void> setToken(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.authCode, authcode);
  }

  static Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.authCode) ?? "";
  }


  static Future<void> setId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.id, id);
  }

  static Future<String> getid() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.id) ?? "";
  }

  static Future<void> setDeviceId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.deviceId, id);
  }

  static Future<String> getDeviceId() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.deviceId) ?? "";
  }
  static Future<void> setUserType(String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.user_type, userType);
  }

  static Future<String> getUserType() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.user_type) ?? "";
  }
  static Future<void> setPushToken(String pushToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.fcm_token, pushToken);
  }
  static Future<void> deleteFcmToken(String pushToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.fcm_token, pushToken);
  }


  static Future<String> getPushToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.fcm_token) ?? "";
  }





  // static Future<void> setName(String name) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(Constance.name, name);
  // }
  //
  // static Future<String> getName() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(Constance.name) ?? "";
  // }
  // static Future<void> setImage(String image) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(Constance.IMAGE, image);
  // }
  //
  // static Future<String> getImage() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(Constance.IMAGE) ?? "";
  // }
  // static Future<void> setPropertyName(String image) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(Constance.IMAGE, image);
  // }
  //
  // static Future<String> getPropertyName() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(Constance.IMAGE) ?? "";
  // }
}