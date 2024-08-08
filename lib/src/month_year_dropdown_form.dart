import 'package:dropdown_month_year_selector/dropdown_month_year_selector.dart';
import 'package:flutter/material.dart';

class MonthYearDropdownForm extends StatefulWidget {
  @override
  _MonthYearDropdownFormState createState() => _MonthYearDropdownFormState();
}

class _MonthYearDropdownFormState extends State<MonthYearDropdownForm> {
  TextEditingController _textEditingController = TextEditingController();
  String selectedDate = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _showCalendarDialog(context);
          },
          child: TextFormField(
            controller: _textEditingController,
            decoration: InputDecoration(
              labelText: 'Select Date',
            ),
            enabled: false,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Selected Date: $selectedDate',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Date'),
          content: MonthYearDropdownCalendar(
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
                _textEditingController.text = date;
              });
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
