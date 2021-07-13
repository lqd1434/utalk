import 'package:myapp/response/DataBody.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveLoginData(DataBody? dataBody) async{
  var prefs = await SharedPreferences.getInstance();
  final keys = dataBody!.user!.toJson().keys;
  final json = dataBody.user!.toJson();
  for (var key in keys) {
    prefs.setString(key, json[key].toString());
  }
}

Future<String> getSharedData(String key) async{
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '';
}

void removeAllSharedData() async{
  var prefs = await SharedPreferences.getInstance();
  prefs.clear();
}