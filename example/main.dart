import 'package:flutter/material.dart';
import 'package:your_package_name/dropdown_month_year_selector.dart';

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
        body: Center(
          child: MonthYearDropdownForm(),
        ),
      ),
    );
  }
}
