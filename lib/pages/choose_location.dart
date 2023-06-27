import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class choose_location extends StatefulWidget {
  const choose_location({super.key});

  @override
  State<choose_location> createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {

  List<worldtime> locations=[
    worldtime(location:'London', flag:'uk.png' , url:'Europe/London'),
    worldtime(location: 'Berlin', flag: 'greece.png', url:'Europe/Berlin'),
    worldtime(location:'Cairo' , flag:'egypt.png' , url:'Africa/Cairo'),
    worldtime(location: 'Nairobi', flag:'kenya.png' , url:'Africa/Nairobi'),
    worldtime(location: 'Chicago', flag: 'usa.png', url:'America/Chicago'),
    worldtime(location: 'New_York', flag: 'usa.png', url:'America/New_York'),
    worldtime(location: 'Seoul', flag:'south_korea.png' , url:'Asia/Seoul'),
    worldtime(location:'Jakarta' , flag:'indonesia.png' , url:'Asia/Jakarta'),

  ];

void updatetime(index) async{
  worldtime instance=locations[index];
  await instance.gettime();
  Navigator.pop(context, {
    'location':instance.location,'flag':instance.flag,'time':instance.time,
    'isDaytime':instance.isDaytime,
  }
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('choose location'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return  Padding(
            padding:  EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updatetime(index);
                },
                title:Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:AssetImage('${locations[index].flag}') ,
                ),
              ),
            ),
          );

        }
      )

    );
  }
}
