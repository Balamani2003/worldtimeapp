

import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
initialRoute: '/',
    routes: {
  '/':(context)=> Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>choose_location(),



    },

  ));
}

