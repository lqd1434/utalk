// ignore_for_file: file_names
import 'User.dart';

class DataBody {
  String? access_token;
  User? user;

  DataBody({this.access_token, required this.user});

  factory DataBody.fromJson(Map<String, dynamic> json) {
    return DataBody(
      access_token: json['access_token'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = access_token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
