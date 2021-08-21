// ignore_for_file: file_names

import 'DataBody.dart';

class NestRes<T> {
  T? dataBody;
  String description;
  int statusCode;

  NestRes({required this.dataBody, required this.description, required this.statusCode});

  factory NestRes.fromJson(Map<String, dynamic> json) {
    if (T == String) {
      return NestRes(
        dataBody: json['dataBody'],
        description: json['description'],
        statusCode: json['statusCode'],
      );
    }
    return NestRes(
      dataBody: json['dataBody'] != null ? (DataBody.fromJson(json['dataBody']) as T) : null,
      description: json['description'],
      statusCode: json['statusCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['statusCode'] = statusCode;
    if (T == String) {
      if (dataBody != null) {
        data['dataBody'] = data['dataBody'];
      }
    } else {
      if (dataBody != null) {
        data['dataBody'] = (dataBody as DataBody).toJson();
      }
    }
    return data;
  }
}
