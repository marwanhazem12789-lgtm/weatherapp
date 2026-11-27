
import 'package:material_ui/material_ui.dart';

class CountryWeatherTile extends StatelessWidget {
  final dynamic data;
  final VoidCallback? onTap;

  const CountryWeatherTile({
    super.key,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = data["countryImageUrl"];
    final name = data["name"];
    final temp = data["tempreature"];

    return SizedBox(
      height: 100,
      child: Card(
        elevation: 15,
        child: ListTile(
          leading:Image.network(imageUrl),
             
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "$temp°C",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}