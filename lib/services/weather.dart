import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Future<dynamic> getloactionweather() async{
    Location location = new Location();
    await location.getcurrentlocation();
    var latitude = location.latitude;
   var  longitude = location.longitude;


    NetworkHelper networkHelper = new NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=39d0e839e880f6879b20b617b3007d5f&units=metric");
    var weatherData = await networkHelper.getdata();
    return weatherData;
  }
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
