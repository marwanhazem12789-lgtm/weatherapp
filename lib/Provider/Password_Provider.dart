import 'package:flutter/widgets.dart';

class  PasswordProvider extends ChangeNotifier {
  bool istrue = true;
void passwordshow(){
  istrue = !istrue;
  notifyListeners();

}
}