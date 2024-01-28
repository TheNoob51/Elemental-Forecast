// ignore_for_file: camel_case_types

import 'package:elementalforecast/constants/linkers.dart';

class cityname extends StatelessWidget {
  const cityname({
    super.key,
    required this.city,
  });

  final String city;

  @override
  Widget build(BuildContext context) {
    return Row(
      //City and current location Division
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            city,
            textAlign: TextAlign.center,
            style: const TextStyle(color: black, fontSize: 40),
          ),
        ),
      ],
    );
  }
}
