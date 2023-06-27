import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    data = data.isNotEmpty? data: routeSettings?.arguments as Map;

    if (data == null || data!['location'] == null || data!['time'] == null) {
      // Handle the case where data or its properties are null
      return Scaffold(
              backgroundColor: Colors.blue[900],
              body:Center(
                child:SpinKitCubeGrid(
                    color: Colors.white,
                    size: 80.0,
        ),
              ),


      );
}
print(data);
    //set background
    String bgImage=data!['isDaytime'] ? 'day.png':'night.png';
   Color? bgColor=data!['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
backgroundColor: bgColor,
      body: SafeArea(
        child:Container (
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit:BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async{
                   dynamic result=await Navigator.pushNamed(context, '/location');
                  setState(() {


                   data={
                    'time':result['time'],
                    'location':result['location'],

                    'isDaytime':result['isDaytime'],
                     'flag':result['flag'],

                  };
                  });
                   },

                  icon: Icon(Icons.edit_location,
                  color: Colors.grey[300],
                  ),
                  label: Text('Edit location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),

                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data!['location'].toString(),
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data!['time'].toString(),
                  style: TextStyle(
                    fontSize: 66.0,
                    letterSpacing: 6.0,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
