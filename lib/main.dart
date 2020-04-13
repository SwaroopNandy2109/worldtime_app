import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_loc.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    ));
