import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag; //url to an image
  String url; //location url of api
  bool isDayTime;

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

      isDayTime = now.hour > 4 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Couldn't Get Data";
      print(e);
    }
  }

  WorldTime({this.location, this.flag, this.url});
}
