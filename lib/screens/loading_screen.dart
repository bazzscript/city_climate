import 'package:city_climate/screens/location_screen.dart';
import 'package:city_climate/services/weather.dart';
import 'package:city_climate/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  //THE FIRST THINGS THAT RUNS OR
  //GETS EXECUTED IMMEDIATELY THIS PAGE IS CALLED
  //IS IN THIS INITSTATE
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  //THE SECOND THINGS THAT RUNS OR
  //GETS EXECUTED IMMEDIATELY
  //THIS PAGE IS CALLED, IT BUILDS THE PAGE U.I.
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SpinKitChasingDots(
            color: Colors.white,
            size: 100.0,
          ),
          Text(
            'Loading Weather Data',
            style: kButtonTextStyle,
          )
        ],
      ),
    ));
  }
}
