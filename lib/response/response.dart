// ignore_for_file: file_names

import 'DataBody.dart';

class NestRes {
  DataBody? dataBody;
  String description;
  int statusCode;

  NestRes({required this.dataBody, required this.description, required this.statusCode});

  factory NestRes.fromJson(Map<String, dynamic> json) {
    return NestRes(
      dataBody: json['dataBody'] != null ? DataBody.fromJson(json['dataBody']) : null,
      description: json['description'],
      statusCode: json['statusCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['statusCode'] = statusCode;
    if (dataBody != null) {
      data['dataBody'] = dataBody!.toJson();
    }
    return data;
  }
}
