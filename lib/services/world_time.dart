import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
class worldtime{
  String location;// location name for the ui
  String time='';// the time in that location
  String flag;  //unique flag for each country
  String url; //url change only contitent and country
  bool isDaytime=false; // true or false if daytime or not
worldtime({required this.location,required this.flag,required this.url});
  Future<void> gettime() async{
    try{
      Uri Url = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      http.Response response = await http.get(Url);
      // Rest of the code remains the same...


      Map data=jsonDecode(response.body);
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);
      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));
      //set time
      isDaytime= now.hour > 6 && now.hour < 20 ?true:false;
   time=DateFormat.jm().format(now);

    }
    catch(e){
      print('caught error :$e');
      time='could not get time data';

    }



  }
}
