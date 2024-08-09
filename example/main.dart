import 'package:dropdown_month_year_selector/src/month_year_dropdown_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Month and Year Dropdown Calendar Example'),
        ),
        body: const Center(
          child: MonthYearDropdownForm(),
        ),
      ),
    );
  }
}
