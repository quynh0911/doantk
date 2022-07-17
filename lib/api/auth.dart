import 'package:dio/dio.dart';
import 'package:do_an_tk/const/address.dart';

class AuthApi{
  Future signIn(String email, String password) async{
    Dio _dio = Dio();
    print("SignIn");
    try{
       var response =  await _dio.post(Networks.signin, data: {
        "email": email,
        "password": password
      }, /*options: Options(headers: {"Content-Type":"application/json"}),*/);
       print(response);
       return response.statusCode;
    }
    on DioError  catch(e){
      print(e.toString());
    }
    return 0;
  }
}