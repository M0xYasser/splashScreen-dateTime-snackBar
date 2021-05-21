import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();

  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2019, 1),
      lastDate: DateTime(2022, 1),
      helpText: 'Select a date',
      confirmText: "Next To Select Time",
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
        _selectTime();
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      helpText: 'Select a time',
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        showInSnackBar();
      });
    }
  }

  void showInSnackBar() {
    final snackBar = SnackBar(
      content: Text(
          "Date : ${_date.day}/${_date.month}/${_date.year} & Time : ${_time.hour}:${_time.minute}"),
      action: SnackBarAction(
        label: 'Change',
        onPressed: () {
          _selectDate();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${_date.day}/${_date.month}/${_date.year}",
              style: TextStyle(fontFamily: "time1", fontSize: 50),
            ),
            Text(
              "${_time.hour}:${_time.minute}",
              style: TextStyle(fontFamily: "time1", fontSize: 40),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Click to chosse time and date",
                    style:
                        TextStyle(fontFamily: "textfont", color: Colors.white),
                  ),
                ),
              ),
              onTap: _selectDate,
            ),
          ],
        ),
      ),
    );
  }
}
