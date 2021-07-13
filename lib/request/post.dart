import 'package:dio/dio.dart';

Future<Response> doRegister(String email,String name,String password,String verifyCode)async{
   return await Dio().post(
     'http://47.103.211.10:8080/register',
     data: {
       'email':email,
       'name':name,
       'password':password,
       'verifyCode':verifyCode
     },
   );
 }


Future<Response> sendRegisterEmail(String email) async{
  return await Dio().post(
    'http://47.103.211.10:8080/email/send',
    data: {
      'email':email,
    },
  );
}