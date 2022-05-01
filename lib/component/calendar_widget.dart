

import 'package:flutter/material.dart';
import 'package:health_app/data/days_months_data.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();
  int currentDateIndex = 0;
  ScrollController scrollController = ScrollController();
  List listOfMonths = ListOfDaysMonth().listOfMonths;
  List listOfDays = ListOfDaysMonth().listOfDays;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            color: Color(0xFFC6E5F7),
            child: Padding(
              padding: EdgeInsets.all(5.04),
              child: Text(
                selectedDate.day.toString() +
                    listOfMonths[selectedDate.month - 1] +
                    ',' +
                    selectedDate.year.toString(),
                style: TextStyle(
                    fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
          ),
        ),
    SizedBox(
      height: height*0.1 -70,
    ),
    Flexible(
      child: Container(
        height: height*0.1,
        child: ListView.separated(
            itemCount: 365,
            separatorBuilder: (context,index)=>SizedBox(width: 10.0),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentDateIndex = index;
                selectedDate = DateTime.now().add(Duration(days: index));
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 10.0),
              height: height * 0.1,
              width: width/2 - 152,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: currentDateIndex == index ? Color(0xFF4F4F4F): Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    listOfDays[DateTime.now()
                        .add(Duration(days: index))
                        .weekday -
                        1]
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: currentDateIndex == index
                            ? Color(0xFF7B7B7B)
                            : Color(0XFFDCDCDD)),
                  ),

                  Text(
                  DateTime.now()
                  .add(Duration(days: index))
                  .day
                  .toString(),
              style: TextStyle(
                fontFamily: 'Inter',
                  fontSize: 20,

                  color: currentDateIndex == index
                      ? Color(0xFFB4B5B6)
                      : Color(0xFF868687)),
            ),
                ],
              ),
            ),
          );
        }),
          ),
    ),
      ],
    );
  }
}
