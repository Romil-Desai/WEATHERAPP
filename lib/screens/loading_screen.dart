import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getlocations();
  }

  void getlocations() async {
    var weatherdata = await WeatherModel().getlocationdata();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWave(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
