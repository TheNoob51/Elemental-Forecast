// ignore_for_file: prefer_const_constructors

import 'package:elementalforecast/api_info/api_key.dart';
import 'package:elementalforecast/constants/linkers.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//the code for calling in geolocator data logic

  String city = "city";
  String currentLocation = "current Location";
  double? Latitude;
  double? Longitude;

  Future<void> _getUserLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Latitude = position.latitude;
    Longitude = position.longitude;

    setState(() {
      currentLocation = '${position.latitude}, ${position.longitude}';
    });
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    setState(() {
      city = '${placemark.locality}, ${placemark.administrativeArea}';
    });
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String Latitude_main = Latitude.toString();
      String Longitude_main = Longitude.toString();
      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$Latitude_main&lon=$Longitude_main&appid=$apikey&units=metric'));
      final forecastData = jsonDecode(res.body);
      if (forecastData['cod'] != '200') {
        throw 'An unexpected error occurred';
      } else {
        return forecastData;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> _refreshLocation() async {
    _getUserLocation();
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('yMMMMd').format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
            title: Text(date),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () => {}, icon: const Icon(Icons.search_sharp)),
            actions: [
              IconButton(
                //refresh Mechanism
                icon: const Icon(Icons.refresh_sharp),
                onPressed: () {
                  setState(() {
                    _refreshLocation();
                  });
                },
              )
            ]),

        //future builder
        body: FutureBuilder(
            future: getCurrentWeather(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (snapshot.hasError == true) {
                return SnackBar(content: Text(snapshot.error.toString()));
              }

              final forecastData = snapshot.data!;
              double currentTemp = forecastData['list'][0]['main']['temp'];
              String currentWeather =
                  forecastData['list'][0]['weather'][0]['description'];
              num currentHumidity = forecastData['list'][0]['main']['humidity'];
              num currentPressure = forecastData['list'][0]['main']['pressure'];
              num currentWindSpeed = forecastData['list'][0]['wind']['speed'];
              String IconID = forecastData['list'][0]['weather'][0]['icon'];

              // final forecastData = snapshot.data!;
              // double currentTemp = forecastData['main']['temp'];
              // String iconID = forecastData['weather'][0]['icon'];
              // String currentWeather = forecastData['weather'][0]['description'];
              // num currentHumidity = forecastData['main']['humidity'];
              // num currentPressure = forecastData['list'][0]['main']['pressure'];
              // num currentWindSpeed = forecastData['list'][0]['wind']['speed'];

              return SingleChildScrollView(
                child: Column(
                  //Main Column for page
                  children: [
                    //calling citys name with this widget
                    cityname(city: city),

                    10.heightBox,

                    //getting longitude and latitude with this widget
                    LocationCordinate(currentLocation: currentLocation),

                    //getting weather and other static things (still gotta work on it)
                    Container(
                      //weather icon and temp and description
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
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
                                '${currentTemp.toStringAsFixed(0)}°C',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 45),
                              ),
                              Text(
                                //comment
                                currentWeather,
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
                        //Humidity, windspeed, sun duration, wind pressure widget
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
                                Text("$currentHumidity")
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
                                Text("$currentWindSpeed")
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
                          ),
                          Container(
                            color: red,
                            child: Column(
                              //Humidity
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.thermostat_outlined,
                                  size: 40,
                                ),
                                5.heightBox,
                                const Text(
                                  "Pressure",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("$currentPressure")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(10.0),
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
                          5.heightBox,
                          SizedBox(
                            //for cards
                            height: 240,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                final time = DateTime.parse(
                                    forecastData['list'][index + 2]['dt_txt']);
                                final weather = forecastData['list'][index + 2]
                                    ['weather'][0]['main'];
                                String formattedDate =
                                    DateFormat('MMM d').format(time);
                                return HourlyForecastItem(
                                  date: formattedDate,
                                  timeinterval: DateFormat.j().format(time),
                                  icon: weather == 'Clouds' ||
                                          weather == 'Rain' &&
                                              weather != 'Clear'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  temperature: forecastData['list'][index + 2]
                                      ['main']['temp'],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          VxToast.show(context, msg: "$Latitude, $Longitude");
                        },
                        child: const Text("Map"))
                  ],
                ),
              );
            }));
  }
}
