import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'src/calender_flutter_aj.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime? calenderSelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CalendarFlutterAj(
      selectedDate: (selectedDate) {
        calenderSelectedDate = selectedDate;
        if (kDebugMode) {
          print(selectedDate);
        }
      },
      backArrow: const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffAED2EC),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_left_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
      forwardArrow: const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffAED2EC),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_right_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
      calenderBackgroundColor: Colors.white,
      showCalenderGradient: true,
      showMonthGradient: true,
      showYearGradient: true,
      dividerColor: Colors.white,
      selectedDayColor: Colors.white,
      selectedDayWidget: Text(
        calenderSelectedDate!.day.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      calenderGradient: const LinearGradient(
        colors: [
          Color(0xff5F94B9),
          Color(0xff6094BA),
          Color(0xff85A3CB),
          Color(0xff8DA4CE),
          Color(0xff8898CE),
          Color(0xff8395CD),
        ],
      ),
      yearGradient: const LinearGradient(
        colors: [
          Color(0xff5F94B9),
          Color(0xff6094BA),
          Color(0xff85A3CB),
          Color(0xff8DA4CE),
          Color(0xff8898CE),
          Color(0xff8395CD),
        ],
      ),
      monthGradient: const LinearGradient(
        colors: [
          Color(0xff5F94B9),
          Color(0xff6094BA),
          Color(0xff85A3CB),
          Color(0xff8DA4CE),
          Color(0xff8898CE),
          Color(0xff8395CD),
        ],
      ),
      calenderSelectedDateBackgroundcolor: Colors.purple,
      showCalenderSelectedDateBackgroundcolor: true,
      calenderSelectedDateColor: Colors.white,
      calenderSelectedDateFontSize: 18,
      calenderSelectedDateBorderRadius: BorderRadius.circular(50),
      dayTextStyle: const TextStyle(
        color: Colors.white,
      ),
      monthBackgroundColor: Colors.black,
      monthTextStyle: const TextStyle(
        color: Colors.white,
      ),
      weekdaysTextStyle: const TextStyle(
        color: Colors.white,
      ),
      yearBackgroundColor: Colors.black,
      yearTextStyle: const TextStyle(
        color: Colors.white,
      ),
      calenderUnSelectedDatesColor: Colors.white,
      yearPopHeadingText: "year",
      yearPopHeadingTextStyle: const TextStyle(
        color: Colors.white,
      ),
      yearsListTextStyle: const TextStyle(
        color: Colors.white,
      ),
      monthPopHeadingText: "month",
      monthPopHeadingTextStyle: const TextStyle(
        color: Colors.white,
      ),
      monthsListTextStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
