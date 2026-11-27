class WeatherModel {
  List<dynamic>countries;
  WeatherModel({required this.countries});
  factory WeatherModel.fromJson(Map<String , dynamic> Json){
return WeatherModel(countries: Json["country"]);
  }
}