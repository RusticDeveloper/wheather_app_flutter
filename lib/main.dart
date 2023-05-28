import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_app/views/home_screen.dart';

void main() => runApp(const WheatherApp());

class WheatherApp extends StatefulWidget {
  const WheatherApp({super.key});

  @override
  State<WheatherApp> createState() => _WheatherAppState();
}

class _WheatherAppState extends State<WheatherApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
      title: 'Aplicacion del clima',
      // debugShowCheckedModeBanner: false,
    );
  }
}
