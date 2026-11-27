import 'package:material_ui/material_ui.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data["name"],
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Card(
            elevation: 20,
            child: Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    data["weatherImageUrl"].toString(),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  data["name"],
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Weather"),
                    SizedBox(width: 5),
                    Text(data["weatherCondition"]),
                    SizedBox(width: 10),
                  ],
                ),
                Text("${data["tempreature"]}°C"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
