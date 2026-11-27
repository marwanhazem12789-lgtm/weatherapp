import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Provider/Auth_Provider.dart';
import 'package:weatherapp/Provider/Password_Provider.dart';
import 'package:weatherapp/Provider/Weather_Provider.dart';
import 'package:weatherapp/Views/Weather_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PasswordProvider(),),
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
        ChangeNotifierProvider(create: (context) => WeatherProvider(),),
      ],
      child: MaterialApp(
        home: WeatherScreen(),
      ),
    );
  }
}
