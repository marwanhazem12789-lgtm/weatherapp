import 'package:dio/dio.dart';
import 'package:weatherapp/Models/auht_model.dart';

class AuthService {
  static Dio dio = Dio();

  

 static Future<AuhtModel> SignUpdata({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {"Name": name, "Email": email, "Password": password,"phone" : phone},
      );

      return AuhtModel.fomJson(response.data); 
    } 


 static Future<AuhtModel> LoginUpdata({
    required String email,
    required String password,
  }) async {
    
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return AuhtModel.fomJson(response.data); 
    } 

}