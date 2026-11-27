import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:weatherapp/Models/Weather_Model.dart';
import 'package:weatherapp/Service/Weather_Service.dart';

class WeatherProvider extends ChangeNotifier {
WeatherModel? weatherModel;
Future<void> getproviderforweather()async{
  weatherModel = await WeatherService.getserviceforweatther();
  notifyListeners();
}
}