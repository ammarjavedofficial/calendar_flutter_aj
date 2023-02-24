# calender_flutter_aj

This package can be used to show calender in flutter application

https://user-images.githubusercontent.com/54344194/221199967-c6e6f230-767c-4aad-a9a2-4f0212028659.mp4




```
  CalenderFlutterAj(
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
    ),
          
```

## Query
You can contact me
