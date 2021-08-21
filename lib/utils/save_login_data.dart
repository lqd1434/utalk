import 'package:myapp/response/DataBody.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoginData(DataBody? dataBody) async {
  var prefs = await SharedPreferences.getInstance();
  final keys = dataBody!.user!.toJson().keys;
  final json = dataBody.user!.toJson();
  prefs.setString('token', dataBody.access_token!);
  for (var key in keys) {
    prefs.setString(key, json[key].toString());
  }
}

void setSharedDataForString(String key, String value) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<String> getSharedData(String key) async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '';
}

void removeAllSharedData() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
