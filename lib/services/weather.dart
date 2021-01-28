import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';

const apiid = '3c860db21c9c0a6b838fc86467620f14';

class WeatherModel {
  Future<dynamic> getcitydata(String cityname) async {
    NetworkHelper networkhelper =
        NetworkHelper('https://api.openweathermap.org/data/2.5/weathe'
            'r?q=$cityname&appid=$apiid&units=metric');
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getlocationdata() async {
    Location currentlocation = Location();
    await currentlocation.getLocation();
    NetworkHelper networkhelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weathe'
        'r?lat=${currentlocation.latitude}&lon=${currentlocation.longitude}&appid=$apiid&units=metric');
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
