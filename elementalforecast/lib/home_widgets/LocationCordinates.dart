// ignore_for_file: file_names

import 'package:elementalforecast/constants/linkers.dart';

class LocationCordinate extends StatelessWidget {
  const LocationCordinate({
    super.key,
    required this.currentLocation,
  });

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      //for icon and current location positioning
      children: [
        const Icon(Icons.my_location_sharp),
        5.widthBox,
        Text(
          currentLocation,
          style: const TextStyle(color: black),
        ),
      ],
    );
  }
}
