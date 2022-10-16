import 'package:clima/services/location.dart';
import 'networking.dart';

const apiKey = '8d6ce3070e4230695cb1914ac5f8018b';
const api = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherWithCityName(String cityName) async {
    NetworkHelper weatherData =
        NetworkHelper('$api?q=$cityName&appid=$apiKey&units=metric');
    return await weatherData.getData();
  }

  Future<dynamic> getLocationAndDataApi() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$api?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var data = await networkHelper.getData();
    return data;
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
