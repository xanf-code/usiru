import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:usiru/Model/WeatherStations.dart';
import 'package:usiru/Reusables/LocationCard.dart';
import 'package:http/http.dart' as http;

class LocationAQIwidget extends StatefulWidget {
  const LocationAQIwidget({
    Key key,
  }) : super(key: key);

  @override
  _LocationAQIwidgetState createState() => _LocationAQIwidgetState();
}

class _LocationAQIwidgetState extends State<LocationAQIwidget> {

  List<StationData> _stationValues = List();
  void WeatherStationData() async {
    var response = await http.get(
        'https://api.waqi.info/search/?keyword=bangalore&token=5c3ffa389d47509ba96a80b8336d0995b30aed0c');
    if (response.statusCode == 200) {
      var sata = StationData.fromJson(json.decode(response.body));
      setState(() {
        _stationValues.add(sata);
      });
    }
  }

  @override
  void initState() {
    WeatherStationData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: _stationValues.length != 0 ? PageView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          Locations(
            area: 'BTM Layout',
            image:
            "https://www.karnataka.com/wp-content/uploads/2014/04/Madiwala_Lake_Bangalore.jpg",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[7].aqi,
          ),
          Locations(
            area: "Peenya",
            image:
            "https://www.tvdaijiworld.com/images6/allwyn_270819_peenya1.jpg",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[0].aqi,
          ),
          Locations(
            area: "Bapuji Nagar",
            image:
            "https://i2.wp.com/orissadiary.com/wp-content/uploads/2020/05/EXzaODJX0AEinXb.jpg?fit=1280%2C578&ssl=1",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[4].aqi,
          ),
          Locations(
            area: "Silk Board",
            image:
            "https://www.thehindu.com/news/cities/bangalore/4c3agu/article29578424.ece/ALTERNATES/LANDSCAPE_1200/3BGJAM",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[3].aqi,
          ),
          Locations(
            area: "Jayanagar 5th Block",
            image:
            "https://th.thgim.com/migration_catalog/article11438369.ece/alternates/FREE_435/05BG_GANESH_TEMPLE_JAYANAGAR",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[2].aqi,
          ),
          Locations(
            area: "Hebbal",
            image:
            "https://www.thehindu.com/news/cities/bangalore/1cdt8c/article26582205.ece/ALTERNATES/LANDSCAPE_1200/20BGHEBBALFLYOVER",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[6].aqi,
          ),
          Locations(
            area: "Hombegowda Nagar",
            image:
            "https://teja14.kuikr.com/is/p/t20/430x200/public/images/gallery/locality_masthead/291/Bangalore_HombegowdaNagar_Masthead_5613c4e7ed0e0.jpg",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[1].aqi,
          ),
          Locations(
            area: "City Railway Station",
            image:
            "https://images.newindianexpress.com/uploads/user/imagelibrary/2019/1/25/w900X450/Mysuru.jpg",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[5].aqi,
          ),
          Locations(
            area: "SaneguravaHalli",
            image:
            "https://upload.wikimedia.org/wikipedia/commons/0/01/Devanahalli_Airport_area_in_Bangalore_Sky_view_115647.jpg",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[8].aqi,
          ),
          Locations(
            area: "BWSSB",
            image:
            "https://www.deccanherald.com/sites/dh/files/article_images/2019/11/20/BWSSB-DH-1574194930.jpg",
            subtitle: "Air Quality is Moderate",
            aqi: _stationValues[0].data[9].aqi,
          ),
        ],
      ) : Container()
    );
  }
}