import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String subcity = "";
  String date = DateFormat('yMMMMd').format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAdress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAdress(latitude, longitude) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];
    // print(place);
    setState(() {
      subcity = place.subLocality!;
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 25),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: TextStyle(
                color: Colors.lightBlueAccent[900], fontSize: 25, height: 1.5),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 25),
          alignment: Alignment.topLeft,
          child: Text(
            subcity,
            style: TextStyle(
                color: Colors.lightBlueAccent[900], fontSize: 15, height: 1.5),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 25),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(
                color: Colors.lightBlueAccent[900], fontSize: 15, height: 1.5),
          ),
        )
      ],
    );
  }
}
