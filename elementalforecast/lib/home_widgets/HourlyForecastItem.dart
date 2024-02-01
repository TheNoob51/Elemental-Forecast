import 'package:elementalforecast/constants/linkers.dart';

class HourlyForecastItem extends StatelessWidget {
  final String date;
  final String timeinterval;
  final IconData icon;
  final double temperature;
  const HourlyForecastItem({
    super.key,
    required this.date,
    required this.timeinterval,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(timeinterval,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            10.heightBox,
            Icon(
              icon,
              size: 80,
            ),
            10.heightBox,
            Text(
              '${(temperature).toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
