import 'package:flutter/material.dart';

class CalendarFlutterAj extends StatefulWidget {
  const CalendarFlutterAj({
    super.key,
    required this.selectedDate,
    required this.dateTime,
    this.backArrow,
    this.calenderGradient,
    this.calenderSelectedDateBackgroundcolor,
    this.calenderSelectedDateColor,
    this.calenderSelectedDateFontSize,
    this.calenderSelectedDateBorderRadius,
    this.dayTextStyle,
    this.forwardArrow,
    this.monthGradient,
    this.monthTextStyle,
    this.weekdaysTextStyle,
    this.yearGradient,
    this.yearTextStyle,
    this.calenderBackgroundColor,
    this.monthBackgroundColor,
    this.yearBackgroundColor,
    this.calenderUnSelectedDatesColor,
    this.yearPopHeadingText,
    this.yearPopHeadingTextStyle,
    this.yearsListTextStyle,
    this.monthPopHeadingText,
    this.monthPopHeadingTextStyle,
    this.monthsListTextStyle,
    this.showCalenderGradient = false,
    this.showMonthGradient = false,
    this.showYearGradient = false,
    this.showCalenderSelectedDateBackgroundcolor = false,
    this.dividerColor,
    this.selectedDayColor,
    this.selectedDayWidget,
  });

  final void Function(DateTime) selectedDate;
  final DateTime dateTime;
  final Gradient? calenderGradient;
  final Gradient? monthGradient;
  final Gradient? yearGradient;
  final Color? calenderBackgroundColor;
  final Color? monthBackgroundColor;
  final Color? yearBackgroundColor;
  final TextStyle? yearTextStyle;
  final TextStyle? monthTextStyle;
  final Widget? backArrow;
  final TextStyle? dayTextStyle;
  final Widget? forwardArrow;
  final TextStyle? weekdaysTextStyle;
  final Color? calenderSelectedDateBackgroundcolor;
  final bool? showCalenderSelectedDateBackgroundcolor;
  final BorderRadius? calenderSelectedDateBorderRadius;
  final double? calenderSelectedDateFontSize;
  final Color? calenderSelectedDateColor;
  final Color? calenderUnSelectedDatesColor;
  final String? yearPopHeadingText;
  final TextStyle? yearPopHeadingTextStyle;
  final TextStyle? yearsListTextStyle;
  final String? monthPopHeadingText;
  final TextStyle? monthPopHeadingTextStyle;
  final TextStyle? monthsListTextStyle;
  final bool? showCalenderGradient;
  final bool? showMonthGradient;
  final bool? showYearGradient;
  final Color? dividerColor;
  final Color? selectedDayColor;
  final Widget? selectedDayWidget;

  @override
  // _CalendarFlutterAjState createState() => _CalendarFlutterAjState();
  State<CalendarFlutterAj> createState() => _CalendarFlutterAjState();
}

class _CalendarFlutterAjState extends State<CalendarFlutterAj> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.calenderBackgroundColor ?? Colors.white,
          gradient: widget.showCalenderGradient == true
              ? widget.calenderGradient ?? linearGradient
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Wrap(
            runSpacing: 15,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            _pickYearPop(selectedDate: widget.selectedDate),
                        child: Text(
                          "${_selectedDate.year}",
                          style: widget.yearTextStyle ?? yearTextStyle,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () =>
                            _pickMonthPop(selectedDate: widget.selectedDate),
                        child: Text(
                          months.elementAt(_selectedDate.month - 1),
                          style: widget.monthTextStyle ?? monthTextStyle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _selectedDate = DateTime(_selectedDate.year,
                              _selectedDate.month - 1, _selectedDate.day);
                          setState(() {});
                          widget.selectedDate(_selectedDate);
                        },
                        child: widget.backArrow ?? backArrow,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      widget.selectedDayWidget ??
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: widget.selectedDayColor ??
                                  const Color(0xffAED2EC),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                _nameOfDay(_selectedDate),
                                style: widget.dayTextStyle ?? dayTextStyle,
                              ),
                            ),
                          ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectedDate = DateTime(_selectedDate.year,
                              _selectedDate.month + 1, _selectedDate.day);
                          setState(() {});
                          widget.selectedDate(_selectedDate);
                        },
                        child: widget.forwardArrow ?? forwardArrow,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                color: widget.dividerColor ?? Colors.white,
                width: double.infinity,
                height: 0.5,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
              ),
              SizedBox(
                height: 15,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 7,
                  padding: const EdgeInsets.only(left: 20),
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  children: List.generate(
                    weekdays.length,
                    (index) => Text(
                      weekdays[index],
                      style: widget.weekdaysTextStyle ?? daysTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 255,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 7,
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ..._calender(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickYearPop({
    required void Function(DateTime) selectedDate,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.yearBackgroundColor ?? Colors.white,
              gradient: widget.showYearGradient == true
                  ? widget.yearGradient ?? linearGradient
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    widget.yearPopHeadingText ?? "Select a Year",
                    style: widget.yearPopHeadingTextStyle ??
                        yearPopHeadingTextStyle,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 200,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        int year = DateTime.now().year - 123 + index;

                        return ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          title: Text(
                            year.toString(),
                            style:
                                widget.yearsListTextStyle ?? yearsListTextStyle,
                          ),
                          onTap: () {
                            setState(() {
                              _selectedDate = DateTime(
                                  year, _selectedDate.month, _selectedDate.day);
                            });
                            selectedDate(_selectedDate);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _pickMonthPop({
    required void Function(DateTime) selectedDate,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.monthBackgroundColor ?? Colors.white,
              gradient: widget.showMonthGradient == true
                  ? widget.monthGradient ?? linearGradient
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.monthPopHeadingText ?? "Select a Month",
                    style: widget.monthTextStyle ?? monthTextStyle,
                  ),
                  GridView.builder(
                    itemCount: months.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = DateTime(_selectedDate.year,
                                index + 1, _selectedDate.day);
                          });
                          selectedDate(_selectedDate);
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            months[index].toString(),
                            style: widget.monthsListTextStyle ??
                                monthsListTextStyle,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _calender() {
    List<Widget> daysList = [];
    DateTime monthFirstDay =
        DateTime(_selectedDate.year, _selectedDate.month, 1);
    int monthDays =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    int firstDayWeekDay = monthFirstDay.weekday;

    for (int i = 1; i < firstDayWeekDay; i++) {
      daysList.add(Container());
    }

    for (int i = 1; i <= monthDays; i++) {
      daysList.add(
        GestureDetector(
          onTap: () {
            _selectedDate =
                DateTime(_selectedDate.year, _selectedDate.month, i);
            setState(() {});
            widget.selectedDate(_selectedDate);
          },
          child: Container(
            decoration: BoxDecoration(
              color: _selectedDate.day == i
                  ? widget.showCalenderSelectedDateBackgroundcolor == true
                      ? widget.calenderSelectedDateBackgroundcolor ??
                          Colors.blue
                      : Colors.transparent
                  : Colors.transparent,
              borderRadius: widget.calenderSelectedDateBorderRadius,
            ),
            child: Center(
              child: Text(
                i.toString(),
                style: TextStyle(
                  fontSize: _selectedDate.day == i
                      ? widget.calenderSelectedDateFontSize ?? 20
                      : 15,
                  color: _selectedDate.day == i
                      ? widget.calenderSelectedDateColor ?? Colors.orange
                      : widget.calenderUnSelectedDatesColor ?? Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }

    int remainingDays = 7 - (daysList.length % 7);
    if (remainingDays < 7) {
      for (int i = 0; i < remainingDays; i++) {
        daysList.add(Container());
      }
    }

    return daysList;
  }
}

const daysTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

String _nameOfDay(DateTime date) {
  final weekdays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  return weekdays[date.weekday - 1];
}

final weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

final months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const linearGradient = LinearGradient(
  colors: [
    Color(0xff5F94B9),
    Color(0xff6094BA),
    Color(0xff85A3CB),
    Color(0xff8DA4CE),
    Color(0xff8898CE),
    Color(0xff8395CD),
  ],
);

const selectedMonthTextStyle = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const yearTextStyle = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const monthTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const backArrow = DecoratedBox(
  decoration: BoxDecoration(
    color: Color(0xffAED2EC),
    shape: BoxShape.circle,
  ),
  child: Icon(
    Icons.arrow_left_rounded,
    color: Colors.white,
    size: 20,
  ),
);
const forwardArrow = DecoratedBox(
  decoration: BoxDecoration(
    color: Color(0xffAED2EC),
    shape: BoxShape.circle,
  ),
  child: Icon(
    Icons.arrow_right_rounded,
    color: Colors.white,
    size: 20,
  ),
);
const dayTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const yearPopHeadingTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const yearsListTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const monthPopHeadingTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const monthsListTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
