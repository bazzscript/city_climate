import 'package:city_climate/priv_constants.dart';
import 'package:city_climate/services/location.dart';
import 'package:city_climate/services/networking.dart';

//OPEN WEATHER MAP API URL
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  //BASED ON GIVEN LOCATION NAME, GET WEATHER DATA
  Future<dynamic> getCityWeatherData(String cityName) async {
    var url = Uri.parse(
      '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric',
    );
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  //BASED ON GIVEN LOCATION LATITUDE & lONGITUDE, GET WEATHER DATA
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url = Uri.parse(
      '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  //GET AN ICON BASED ON A GIVEN WEATHER CONDITION
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  //RETURN A SUGGESTION BASED ON GIVEN WEATHER TEMPERATURE
  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
