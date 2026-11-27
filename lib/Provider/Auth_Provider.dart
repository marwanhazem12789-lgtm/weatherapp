import 'package:material_ui/material_ui.dart';
import 'package:weatherapp/Models/auht_model.dart';
import 'package:weatherapp/Service/Auth_Service.dart';

class AuthProvider extends ChangeNotifier {
  AuhtModel? SignUpProviderObj;
  AuhtModel? LoginProviderObj;
   Future<void> getSignUpProvider({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    SignUpProviderObj = await AuthService.SignUpdata(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    notifyListeners();
  }

  
   Future<void> getLoginProvider({
    required String email,
    required String password,
  }) async {
    LoginProviderObj = await AuthService.LoginUpdata(
      email: email,
      password: password,
    );
    notifyListeners();
  }
}
