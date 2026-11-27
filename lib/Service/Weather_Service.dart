import 'package:dio/dio.dart';
import 'package:weatherapp/Models/Weather_Model.dart';

class WeatherService {
  static Dio dio = Dio();
  static Future<WeatherModel> getserviceforweatther() async {
    Response response = await dio.get(
      "https://iats.runasp.net/api/Country/GetCountries",
    );
    return WeatherModel.fromJson(response.data);
  }
}
