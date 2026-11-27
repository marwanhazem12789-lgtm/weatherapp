import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Customs/CountryWeatherTile.dart';
import 'package:weatherapp/Provider/Weather_Provider.dart';
import 'package:weatherapp/Views/Weather_Info.dart';

class WeatherScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Consumer<WeatherProvider>(
          builder: (context, value, child) {
            if (value.weatherModel == null) {
              value.getproviderforweather();
              return CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: value.weatherModel!.countries.length,
              itemBuilder: (context, index) {
                final data = value.weatherModel!.countries[index];
                return CountryWeatherTile(
                  data: data,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherInfo(data: data),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
