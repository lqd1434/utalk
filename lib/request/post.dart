import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myapp/utils/save_login_data.dart';

import 'my_dio.dart';

Future<Response> doRegister(String email, String name, String password, String verifyCode) async {
  return await DioManege.getInstance().dio!.post(
    'http://47.103.211.10:8080/register',
    data: {'email': email, 'name': name, 'password': password, 'verifyCode': verifyCode},
  );
}

Future<Response> sendRegisterEmail(String email) async {
  return await DioManege.getInstance().dio!.post(
    'http://47.103.211.10:8080/email/send',
    data: {
      'email': email,
    },
  );
}

Future<Response> uploadFile(dynamic image) async {
  String id = await getSharedData('id');
  String token = await getSharedData('token');
  String url = 'http://47.103.211.10:8080/user/upload?id=$id';
  FormData formData = FormData.fromMap({
    "file": MultipartFile.fromBytes(await image!.readAsBytes(), filename: image.name),
  });
  return await DioManege.getInstance().dio!.post(url,
      data: formData,
      options: Options(headers: {HttpHeaders.authorizationHeader: 'Bearer${' '}$token'}));
}
