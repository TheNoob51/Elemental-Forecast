import 'package:elementalforecast/constants/linkers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () => {}, icon: const Icon(Icons.search_sharp)),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh_sharp),
                onPressed: () => {},
              )
            ]),
        body: Column(
          //Main Column for page
          children: [
            Row(
              //City and current location Division
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  //Column to separate city and current location
                  children: [
                    const Text(
                      "City",
                      style: TextStyle(color: black, fontSize: 40),
                    ),
                    Row(
                      //for icon and current location positioning
                      children: [
                        const Icon(Icons.my_location_sharp),
                        5.widthBox,
                        const Text(
                          "Current Location",
                          style: TextStyle(color: black),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            20.heightBox,
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: red),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "13°C",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 100),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
