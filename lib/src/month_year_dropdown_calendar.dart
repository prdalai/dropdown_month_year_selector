import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthYearDropdownCalendar extends StatefulWidget {
  final Function(String) onDateSelected;

  MonthYearDropdownCalendar({required this.onDateSelected});

  @override
  _MonthYearDropdownCalendarState createState() =>
      _MonthYearDropdownCalendarState();
}

class _MonthYearDropdownCalendarState extends State<MonthYearDropdownCalendar> {
  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  List<String> years = List.generate(DateTime.now().year - 1959, (index) => (1960 + index).toString());

  String selectedMonth = 'January';
  String selectedYear = '2023';
  int? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedMonth,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMonth = newValue!;
                  selectedDay = null;
                });
              },
              items: months.map((String month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
            ),
            SizedBox(width: 16),
            DropdownButton<String>(
              value: selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  selectedYear = newValue!;
                  selectedDay = null;
                });
              },
              items: years.map((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
            ),
          ],
        ),
        _buildCalendarView(),
        ElevatedButton(
          onPressed: () {
            if (selectedDay != null) {
              final selectedDate = '$selectedMonth $selectedDay, $selectedYear';
              widget.onDateSelected(selectedDate);
            }
          },
          child: Text('Select Date'),
        ),
      ],
    );
  }

  Widget _buildCalendarView() {
    final int year = int.parse(selectedYear);
    final int monthIndex = months.indexOf(selectedMonth) + 1;
    int daysInMonth = DateTime(year, monthIndex + 1, 0).day;

    if (monthIndex == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
      daysInMonth = 29;
    }

    final firstDayOfMonth = DateFormat('yyyy-MM-dd').parse('$year-${monthIndex.toString().padLeft(2, '0')}-01');
    final int startWeekday = firstDayOfMonth.weekday;

    return Container(
      width: 300,
      height: 300,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemBuilder: (context, index) {
          if (index < 7) {
            return Center(
              child: Text(
                ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          } else if (index < startWeekday + daysInMonth) {
            final day = index - startWeekday + 1;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDay = day;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selectedDay == day ? Colors.blue : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    '$day',
                    style: TextStyle(
                      fontWeight: selectedDay == day ? FontWeight.bold : FontWeight.normal,
                      color: selectedDay == day ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
        itemCount: 7 + daysInMonth,
      ),
    );
  }
}
