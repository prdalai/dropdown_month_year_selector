import 'package:dropdown_month_year_selector/src/month_year_dropdown_calendar.dart';
import 'package:flutter/material.dart';

class MonthYearDropdownForm extends StatefulWidget {
  const MonthYearDropdownForm({super.key});

  @override
  _MonthYearDropdownFormState createState() => _MonthYearDropdownFormState();
}

class _MonthYearDropdownFormState extends State<MonthYearDropdownForm> {
  final TextEditingController _textEditingController = TextEditingController();
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
            decoration: const InputDecoration(
              labelText: 'Select Date',
            ),
            enabled: false,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Selected Date: $selectedDate',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Date'),
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
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
