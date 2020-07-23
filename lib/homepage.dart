import 'package:cached_network_image/cached_network_image.dart';
import 'package:flippable_box/flippable_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:usiru/Custom/clipper.dart';
import 'package:usiru/Model/AQIapi.dart';
import 'package:usiru/Reusables/EndTileCard.dart';
import 'package:usiru/Reusables/LocationCard.dart';
import 'package:usiru/Reusables/TempCard.dart';
import 'package:usiru/Reusables/chart.dart';
import 'Reusables/Pollutant_card.dart';
import 'Reusables/QualityCard.dart';
import 'Reusables/TopClipperCard.dart';
import 'Reusables/UVCard.dart';
import 'Reusables/Maps.dart';
import 'Reusables/focusedMenu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<_Home> with SingleTickerProviderStateMixin {
  var temp;
  var humidity;
  var windspeed;

  Future getWeather() async {
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/onecall?lat=12.98&lon=77.6&%20exclude=daily&units=metric&appid=7190713792495b31e2f95f0d3c6b2688");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['current']['temp'];
      this.humidity = results['current']['humidity'];
      this.windspeed = results['current']['wind_speed'];
    });
  }

  List<Aqi> _listValues = List();
  void APIData() async {
    var response = await http.get(
        'https://api.waqi.info/feed/bangalore/?token=5c3ffa389d47509ba96a80b8336d0995b30aed0c');
    if (response.statusCode == 200) {
      var Data = Aqi.fromJson(json.decode(response.body));
      setState(() {
        _listValues.add(Data);
      });
    }
  }

  @override
  void initState() {
    APIData();
    this.getWeather();
    super.initState();
  }

  bool _isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return _listValues.length != 0
        ? SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: TopClipperCard(
                    Image:
                        "https://cdn.dribbble.com/users/1118956/screenshots/6608006/bnglr-final.jpg",
                    title: 'Bengaluru, Karnataka',
                    cityname: _listValues[0]
                        .data
                        .city
                        .name
                        .replaceAll(', Bengaluru, India', ''),
                    mask:
                        "https://images.vexels.com/media/users/3/205468/isolated/preview/6495a5cc336d47f345c90e5b41e2b4c8-pitta-mask-illustration-by-vexels.png",
                    aqi: _listValues[0].data.aqi,
                    percent: _listValues[0].data.aqi / 100,
                    lastUpdate: _listValues[0]
                        .data
                        .debug
                        .sync
                        .toLocal()
                        .toString()
                        .replaceRange(0, 10, '')
                        .replaceRange(5, 12, ''),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _isFlipped = !_isFlipped),
                  child: FlippableBox(
                    duration: 0.5,
                    curve: Curves.fastLinearToSlowEaseIn,
                    front: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: QualityCard(
                        subtitle: 'UNSAFE',
                        temp: '${temp}°c',
                        humidity: '${humidity}%',
                        wind: windspeed.toString(),
                      ),
                    ),
                    back: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: BackContainer(),
                    ),
                    flipVt: true,
                    isFlipped: _isFlipped,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: -0.5,
                          child: Text(
                            "Pollutants",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: 0.5,
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: ShowUpAnimation(
                    direction: Direction.vertical,
                    animationDuration: Duration(milliseconds: 1000),
                    offset: -0.2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: FocusedMenu(
                            child: UVCard(
                              name: 'UV Index',
                              value: _listValues[0]
                                  .data
                                  .forecast
                                  .daily
                                  .uvi[1]
                                  .avg
                                  .toDouble(),
                              percent: _listValues[0]
                                      .data
                                      .forecast
                                      .daily
                                      .uvi[1]
                                      .avg
                                      .toDouble() /
                                  10,
                            ),
                            onedate: DateFormat('dd/MM')
                                .format(_listValues[0]
                                    .data
                                    .forecast
                                    .daily
                                    .uvi[0]
                                    .day)
                                .toString(),
                            onemin: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[0]
                                .min
                                .toString(),
                            onemax: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[0]
                                .max
                                .toString(),
                            oneavg: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[0]
                                .avg
                                .toString(),
                            twodate: DateFormat('dd/MM')
                                .format(_listValues[0]
                                    .data
                                    .forecast
                                    .daily
                                    .uvi[1]
                                    .day)
                                .toString(),
                            twomin: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[1]
                                .min
                                .toString(),
                            twomax: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[1]
                                .max
                                .toString(),
                            twoavg: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[1]
                                .avg
                                .toString(),
                            threedate: DateFormat('dd/MM')
                                .format(_listValues[0]
                                    .data
                                    .forecast
                                    .daily
                                    .uvi[2]
                                    .day)
                                .toString(),
                            threemin: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[2]
                                .min
                                .toString(),
                            threemax: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[2]
                                .max
                                .toString(),
                            threeavg: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[2]
                                .avg
                                .toString(),
                            fourdate: DateFormat('dd/MM')
                                .format(_listValues[0]
                                    .data
                                    .forecast
                                    .daily
                                    .uvi[3]
                                    .day)
                                .toString(),
                            fourmin: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[3]
                                .min
                                .toString(),
                            fourmax: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[3]
                                .max
                                .toString(),
                            fouravg: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[3]
                                .avg
                                .toString(),
                            fivedate: DateFormat('dd/MM')
                                .format(_listValues[0]
                                    .data
                                    .forecast
                                    .daily
                                    .uvi[4]
                                    .day)
                                .toString(),
                            fivemin: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[4]
                                .min
                                .toString(),
                            fivemax: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[4]
                                .max
                                .toString(),
                            fiveavg: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[4]
                                .avg
                                .toString(),
                            sixdate: DateFormat('dd/MM')
                                .format(_listValues[0]
                                    .data
                                    .forecast
                                    .daily
                                    .uvi[5]
                                    .day)
                                .toString(),
                            sixmin: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[5]
                                .min
                                .toString(),
                            sixmax: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[5]
                                .max
                                .toString(),
                            sixavg: _listValues[0]
                                .data
                                .forecast
                                .daily
                                .uvi[5]
                                .avg
                                .toString(),
                            sevendate: '     -     ',
                            sevenmin: '-',
                            sevenmax: '-',
                            sevenavg: '-',
                          ),
                        ),
                        GestureDetector(
                          onLongPress: ()=> Fluttertoast.showToast(
                              msg: "No Data Available",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          ),
                          child: PollutantCard(
                            Name: 'Carbon Monoxide',
                            Comments: 'Average',
                            Value: _listValues[0].data.iaqi.co.v,
                            BarVal: _listValues[0].data.iaqi.co.v / 10,
                            Emoji:
                                "https://media1.giphy.com/media/h4OGa0npayrJX2NRPT/source.gif",
                          ),
                        ),
                        GestureDetector(
                          onLongPress: ()=> Fluttertoast.showToast(
                              msg: "No Data Available",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          ),
                          child: PollutantCard(
                            Name: 'Nitrogen Dioxide',
                            Comments: 'Moderate',
                            Value: _listValues[0].data.iaqi.no2.v,
                            BarVal: _listValues[0].data.iaqi.no2.v / 10,
                            Emoji:
                                "https://i.pinimg.com/originals/0e/3e/e5/0e3ee551876e1ad2a39f89e4adf9168a.gif",
                          ),
                        ),
                        FocusedMenu(
                          child: PollutantCard(
                            Name: 'Ozone',
                            Comments: 'Unhealthy',
                            Value: _listValues[0].data.iaqi.o3.v,
                            BarVal: _listValues[0].data.iaqi.o3.v / 100,
                            Emoji:
                                "https://media1.giphy.com/media/gfI2SFqrtxwf2Aw9x5/giphy.gif",
                          ),
                          onedate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.o3[0].day).toString(),
                          onemin: _listValues[0].data.forecast.daily.o3[0].min.toString(),
                          onemax: _listValues[0].data.forecast.daily.o3[0].max.toString(),
                          oneavg: _listValues[0].data.forecast.daily.o3[0].avg.toString(),
                          twodate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.o3[1].day).toString(),
                          twomin: _listValues[0].data.forecast.daily.o3[1].min.toString(),
                          twomax: _listValues[0].data.forecast.daily.o3[1].max.toString(),
                          twoavg: _listValues[0].data.forecast.daily.o3[1].avg.toString(),
                          threedate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.o3[2].day).toString(),
                          threemin: _listValues[0].data.forecast.daily.o3[2].min.toString(),
                          threemax: _listValues[0].data.forecast.daily.o3[2].max.toString(),
                          threeavg: _listValues[0].data.forecast.daily.o3[2].avg.toString(),
                          fourdate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.o3[3].day).toString(),
                          fourmin: _listValues[0].data.forecast.daily.o3[3].min.toString(),
                          fourmax: _listValues[0].data.forecast.daily.o3[3].max.toString(),
                          fouravg: _listValues[0].data.forecast.daily.o3[3].avg.toString(),
                          fivedate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.o3[4].day).toString(),
                          fivemin: _listValues[0].data.forecast.daily.o3[4].min.toString(),
                          fivemax: _listValues[0].data.forecast.daily.o3[4].max.toString(),
                          fiveavg: _listValues[0].data.forecast.daily.o3[4].avg.toString(),
                          sixdate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.o3[5].day).toString(),
                          sixmin: _listValues[0].data.forecast.daily.o3[5].min.toString(),
                          sixmax: _listValues[0].data.forecast.daily.o3[5].max.toString(),
                          sixavg: _listValues[0].data.forecast.daily.o3[5].avg.toString(),
                          sevendate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.o3[6].day).toString(),
                          sevenmin: _listValues[0].data.forecast.daily.o3[6].min.toString(),
                          sevenmax: _listValues[0].data.forecast.daily.o3[6].max.toString(),
                          sevenavg: _listValues[0].data.forecast.daily.o3[6].avg.toString(),
                        ),
                        FocusedMenu(
                          child: PollutantCard(
                            Name: 'PM\u2081\u2080',
                            Comments: 'Healthy',
                            Value: _listValues[0].data.iaqi.pm10.v,
                            BarVal: _listValues[0].data.iaqi.pm10.v / 100,
                            Emoji:
                                "https://media0.giphy.com/media/QWvra259h4LCvdJnxP/giphy.gif",
                          ),
                          onedate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.pm10[0].day).toString(),
                          onemin: _listValues[0].data.forecast.daily.pm10[0].min.toString(),
                          onemax: _listValues[0].data.forecast.daily.pm10[0].max.toString(),
                          oneavg: _listValues[0].data.forecast.daily.pm10[0].avg.toString(),
                          twodate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.pm10[1].day).toString(),
                          twomin: _listValues[0].data.forecast.daily.pm10[1].min.toString(),
                          twomax: _listValues[0].data.forecast.daily.pm10[1].max.toString(),
                          twoavg: _listValues[0].data.forecast.daily.pm10[1].avg.toString(),
                          threedate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.pm10[2].day).toString(),
                          threemin: _listValues[0].data.forecast.daily.pm10[2].min.toString(),
                          threemax: _listValues[0].data.forecast.daily.pm10[2].max.toString(),
                          threeavg: _listValues[0].data.forecast.daily.pm10[2].avg.toString(),
                          fourdate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.pm10[3].day).toString(),
                          fourmin: _listValues[0].data.forecast.daily.pm10[3].min.toString(),
                          fourmax: _listValues[0].data.forecast.daily.pm10[3].max.toString(),
                          fouravg: _listValues[0].data.forecast.daily.pm10[3].avg.toString(),
                          fivedate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.pm10[4].day).toString(),
                          fivemin: _listValues[0].data.forecast.daily.pm10[4].min.toString(),
                          fivemax: _listValues[0].data.forecast.daily.pm10[4].max.toString(),
                          fiveavg: _listValues[0].data.forecast.daily.pm10[4].avg.toString(),
                          sixdate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.pm10[5].day).toString(),
                          sixmin: _listValues[0].data.forecast.daily.pm10[5].min.toString(),
                          sixmax: _listValues[0].data.forecast.daily.pm10[5].max.toString(),
                          sixavg: _listValues[0].data.forecast.daily.pm10[5].avg.toString(),
                          sevendate: DateFormat('dd/MM').format(_listValues[0].data.forecast.daily.pm10[6].day).toString(),
                          sevenmin: _listValues[0].data.forecast.daily.pm10[6].min.toString(),
                          sevenmax: _listValues[0].data.forecast.daily.pm10[6].max.toString(),
                          sevenavg: _listValues[0].data.forecast.daily.pm10[6].avg.toString(),
                        ),
                        GestureDetector(
                          onLongPress: ()=> Fluttertoast.showToast(
                              msg: "No Data Available",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          ),
                          child: PollutantCard(
                            Name: 'Sulfur Dioxide',
                            Comments: 'Healthy',
                            Value: _listValues[0].data.iaqi.so2.v,
                            BarVal: _listValues[0].data.iaqi.so2.v / 10,
                            Emoji:
                                "https://media0.giphy.com/media/QWvra259h4LCvdJnxP/giphy.gif",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, right: 25, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: -0.5,
                          child: Text(
                            "7-Day Air Quality Forecast",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: 0.5,
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 10, bottom: 20),
                  child: ShowUpAnimation(
                    direction: Direction.vertical,
                    child: Graph(
                      y1: 68,
                      y2: 67,
                      y3: 73,
                      y4: 67,
                      y5: 79,
                      y6: 67,
                      y7: 68,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, right: 25, bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: -0.5,
                          child: Text(
                            "Location Based AQI",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: 0.5,
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Locations(
                        area: "BTM Layout",
                        image:
                            "https://www.karnataka.com/wp-content/uploads/2014/04/Madiwala_Lake_Bangalore.jpg",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                      Locations(
                        area: "Peenya",
                        image:
                            "https://www.tvdaijiworld.com/images6/allwyn_270819_peenya1.jpg",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                      Locations(
                        area: "Bapuji Nagar",
                        image:
                            "https://i2.wp.com/orissadiary.com/wp-content/uploads/2020/05/EXzaODJX0AEinXb.jpg?fit=1280%2C578&ssl=1",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                      Locations(
                        area: "Silk Board",
                        image:
                            "https://www.thehindu.com/news/cities/bangalore/4c3agu/article29578424.ece/ALTERNATES/LANDSCAPE_1200/3BGJAM",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                      Locations(
                        area: "Jayanagar",
                        image:
                            "https://th.thgim.com/migration_catalog/article11438369.ece/alternates/FREE_435/05BG_GANESH_TEMPLE_JAYANAGAR",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                      Locations(
                        area: "Hebbal",
                        image:
                            "https://www.thehindu.com/news/cities/bangalore/1cdt8c/article26582205.ece/ALTERNATES/LANDSCAPE_1200/20BGHEBBALFLYOVER",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                      Locations(
                        area: "Hombegowda Nagar",
                        image:
                            "https://teja14.kuikr.com/is/p/t20/430x200/public/images/gallery/locality_masthead/291/Bangalore_HombegowdaNagar_Masthead_5613c4e7ed0e0.jpg",
                        subtitle: "Air Quality is Moderate",
                        aqi: 97,
                      ),
                      Locations(
                        area: "City Railway Station",
                        image:
                            "https://images.newindianexpress.com/uploads/user/imagelibrary/2019/1/25/w900X450/Mysuru.jpg",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                      Locations(
                        area: "SaneguravaHalli",
                        image:
                            "https://upload.wikimedia.org/wikipedia/commons/0/01/Devanahalli_Airport_area_in_Bangalore_Sky_view_115647.jpg",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                      Locations(
                        area: "BWSSB",
                        image:
                            "https://www.deccanherald.com/sites/dh/files/article_images/2019/11/20/BWSSB-DH-1574194930.jpg",
                        subtitle: "Air Quality is Moderate",
                        aqi: 54,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, right: 25, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: -0.5,
                          child: Text(
                            "Air-Index Map",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: 0.5,
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Map(
                  Urlone:
                      "https://tiles.waqi.info/tiles/usepa-aqi/{z}/{x}/{y}.png?token=7190713792495b31e2f95f0d3c6b2688",
                  Urltwo: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                Center(
                  child: Text(
                    'Data Sources',
                    style: GoogleFonts.openSans(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                EndTile(
                  title: 'Central Pollution Control Board',
                  subtitle: 'https://cpcb.nic.in/',
                ),
              ],
            ),
          )
        : Center(
            child: CachedNetworkImage(
                imageUrl:
                    'https://cdn.dribbble.com/users/2295279/screenshots/7195340/media/0c9860de619ff71bc0ecad591ee429bc.gif'));
  }
}
