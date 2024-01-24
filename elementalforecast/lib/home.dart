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
                //refresh Mechanism
                icon: const Icon(Icons.refresh_sharp),
                onPressed: () {
                  setState(() {});
                },
              )
            ]),
        body: SingleChildScrollView(
          child: Column(
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
              Container(
                //weather icon and temp and description
                margin: const EdgeInsets.only(left: 40, right: 40),
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          //picture
                          Icons.cloud,
                          size: 140,
                        ),
                        Text(
                          //temperature
                          "13°C",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 45),
                        ),
                        Text(
                          //comment
                          "data",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              15.heightBox,
              Container(
                color: blue,
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  //Humidity, windspeed, sun duration widget
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: red,
                      child: Column(
                        //Humidity
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.water_drop_rounded,
                            size: 40,
                          ),
                          5.heightBox,
                          const Text(
                            "Humidity",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text("data")
                        ],
                      ),
                    ),
                    Container(
                      color: golden,
                      child: Column(
                        //Windspeed
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.air_rounded, size: 40),
                          5.heightBox,
                          const Text(
                            "Wind Speed",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text("data")
                        ],
                      ),
                    ),
                    Container(
                      color: yellow,
                      child: Column(
                        //Sunduration
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.sunny,
                                size: 40,
                              ),
                              Icon(
                                Icons.access_time_filled,
                                size: 20,
                              )
                            ],
                          ),
                          5.heightBox,
                          const Text(
                            "Sun Duration",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text("data")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: EdgeInsets.all(10.0),
                //for hourly forecast
                color: red,
                child: Column(
                  children: [
                    Row(
                      children: [
                        6.widthBox,
                        const Icon(Icons.access_time_filled_rounded),
                        5.widthBox,
                        const Text(
                          "Hourly Forecast",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      //for cards
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            //for card (outside)
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20.0),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Icon(
                                      Icons.cloud,
                                      size: 80,
                                    ),
                                    Text("Temperature"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    print("object");
                  },
                  child: Text("data"))
            ],
          ),
        ));
  }
}
