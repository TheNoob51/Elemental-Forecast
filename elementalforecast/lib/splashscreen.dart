// ignore_for_file: camel_case_types, file_names

import 'package:elementalforecast/constants/images.dart';
import 'package:elementalforecast/constants/linkers.dart';
import 'package:elementalforecast/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<Splashscreen> {
  //creating a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const MyHomePage());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  //designing screen with image
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: black,
        child: const Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage(splashimg),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
