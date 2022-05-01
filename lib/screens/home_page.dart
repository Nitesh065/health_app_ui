// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_app/data/json_Data.dart';
import 'package:health_app/component/calendar_widget.dart';
import 'package:health_app/model/feelings_data_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FeelingsData? _data;

  @override
  void initState() {
    _getData();
  }

  void _getData() {
    _data = JsonCon().getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: height / 1,
                child: ListView(children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_ios,
                                color: Colors.black)),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Your Feelings History",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height*0.1 -70,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Your feelings from last 30 days",
                      style: TextStyle(fontFamily: "Inter", fontSize: 15.0),
                    ),
                  ),
                  Container(
                    height: height*0.1+30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: daysFeelingsCard(
                              felling_percentage: _data!
                                          .data!.feelingPercentage!.energetic
                                          .toString() ==
                                      'null'
                                  ? " "
                                  : "${_data!.data!.feelingPercentage!.energetic.toString()}%",
                              image: Image.asset("assest/images/energy.png",
                                  fit: BoxFit.fill),
                              feeling_name: "Energetic"),
                        ),
                        Expanded(
                          child: daysFeelingsCard(
                              felling_percentage: _data!
                                          .data!.feelingPercentage!.sad
                                          .toString() ==
                                      'null'
                                  ? " "
                                  : "${_data!.data!.feelingPercentage!.sad.toString()}%",
                              image: Image.asset("assest/images/sad.png",
                                  fit: BoxFit.fill),
                              feeling_name: "Sad"),
                        ),
                        Expanded(
                          child: daysFeelingsCard(
                              felling_percentage: _data!
                                          .data!.feelingPercentage!.happy
                                          .toString() ==
                                      'null'
                                  ? " "
                                  : "${_data!.data!.feelingPercentage!.happy.toString()}%",
                              image: Image.asset("assest/images/happy.png",
                                  fit: BoxFit.fill),
                              feeling_name: "Happy"),
                        ),
                        Expanded(
                          child: daysFeelingsCard(
                            felling_percentage: _data!
                                        .data!.feelingPercentage!.angry
                                        .toString() ==
                                    'null'
                                ? " "
                                : "${_data!.data!.feelingPercentage!.angry.toString()}%",
                            image: Image.asset("assest/images/angry.png",
                                fit: BoxFit.fill),
                            feeling_name: "Angry",
                          ),
                        ),
                        Expanded(
                          child: daysFeelingsCard(
                            felling_percentage: _data!
                                        .data!.feelingPercentage!.calm
                                        .toString() ==
                                    'null'
                                ? " "
                                : "${_data!.data!.feelingPercentage!.calm.toString()}%",
                            image: Image.asset("assest/images/calm.png",
                                fit: BoxFit.fill),
                            feeling_name: "Calm",
                          ),
                        ),
                        Expanded(
                          child: daysFeelingsCard(
                              felling_percentage: _data!
                                          .data!.feelingPercentage!.bored
                                          .toString() ==
                                      'null'
                                  ? " "
                                  : "${_data!.data!.feelingPercentage!.bored.toString()}%",
                              image: Image.asset("assest/images/bored.png",
                                  fit: BoxFit.fill),
                              feeling_name: "Bored"),
                        ),
                        Expanded(
                          child: daysFeelingsCard(
                              felling_percentage: _data!
                                          .data!.feelingPercentage!.love
                                          .toString() ==
                                      'null'
                                  ? " "
                                  : "${_data!.data!.feelingPercentage!.love.toString()}%",
                              image: Image.asset("assest/images/love.png",
                                  fit: BoxFit.fill),
                              feeling_name: "Love"),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Calendar(),
                  Divider(),
                  Container(
                    height: height*0.1+40,
                    child: ListView.builder(
                        itemCount: _data!.data!.feelingList!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              feelingsTimeRecord(index),
                            ],
                          );
                        }),
                  ),
                  Divider(),
                  Container(
                    child: Text(
                      "You May Find This Interesting",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(
                    height: height*0.1 -70,
                  ),
                  videoRecommendation(height, width),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container videoRecommendation(double height, double width) {
    return Container(
      height: height * 2,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _data!.data!.videoArr!.length,
          separatorBuilder: (context, index) => SizedBox(width: 40.0),
          itemBuilder: (context, index) {
            var videoUrl = _data!.data!.videoArr![index].youtubeUrl.toString();
            String videoId = YoutubePlayer.convertUrlToId(videoUrl).toString();
            YoutubePlayerController _controller = YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                mute: true,
                autoPlay: false,

              ),
            );
            return Container(
              width: width - 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(_data!.data!.videoArr![index].description!,
                        softWrap: true),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: YoutubePlayer(
                      controller: _controller,
                      liveUIColor: Colors.red,
                    ),
                    height: height * 0.2 + 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  )
                ],
              ),
            );
          }),
    );
  }

  Container feelingsTimeRecord(int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            _data!.data!.feelingList![index].submitTime
                .toString()
                .split(" ")[1],
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                fontFamily: "Inter"),
          ),
          SizedBox(
            width: 60.0,
          ),
          Container(
            child: _data!.data!.feelingList![index].feelingName == 'Calm'
                ? Image.asset("assest/images/calm.png")
                : _data!.data!.feelingList![index].feelingName == 'Bored'
                    ? Image.asset("assest/images/bored.png")
                    : _data!.data!.feelingList![index].feelingName == 'Happy'
                        ? Image.asset("assest/images/happy.png")
                        : _data!.data!.feelingList![index].feelingName ==
                                'Energetic'
                            ? Image.asset("assest/images/energy.png")
                            : _data!.data!.feelingList![index].feelingName ==
                                    'Angry'
                                ? Image.asset("assest/images/angry.png")
                                : _data!.data!.feelingList![index]
                                            .feelingName ==
                                        'Sad'
                                    ? Image.asset("assest/images/sad.png")
                                    : Image.asset("assest/images/love.png"),
            height: 20.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Container(
            child: Text(_data!.data!.feelingList![index].feelingName!,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter")),
          ),
        ],
      ),
      height: 40.0,
    );
  }

  Stack daysFeelingsCard(
      {String? felling_percentage, Image? image, String? feeling_name}) {
    return Stack(
      children: [
        Card(
          color: Color(0xFFF1F2F3),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          elevation: 8,
          child: Container(
              height: 85.0,
              width: 35.0,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      felling_percentage.toString(),
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 18.0,
                          fontWeight: FontWeight.w100),
                    ),
                  ))),
        ),
        Container(
          padding: EdgeInsets.only(top: 55.0, right: 8.0),
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 19.0,
            backgroundColor: Color(0xFF85C454),
            child: SizedBox(width: 20.0, child: image),
          ),
        ),
        Container(
          height: 120.0,
          padding: EdgeInsets.only(top: 10.0),
          alignment: Alignment.bottomCenter,
          child: Text(
            feeling_name.toString(),
            style: TextStyle(
                fontFamily: "Inter",
                fontSize: 10.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
