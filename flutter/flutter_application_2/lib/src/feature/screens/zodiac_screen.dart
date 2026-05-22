import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/feature/widgets/my_heart_drawer.dart';
class ZodiacScreen extends StatefulWidget{
  const ZodiacScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ZodiacScreenState createState() => _ZodiacScreenState();
}
class _ZodiacScreenState extends State<ZodiacScreen>{
  DateTime? _selectedDate;
  String? _zodiacSign;
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _getZodiacSign();
      });
    }
  }
  void _getZodiacSign() {
    int day = _selectedDate!.day;
    int month = _selectedDate!.month;
    switch (month) {
      case 1:
        _zodiacSign = (day < 20) ? 'Capricorn' : 'Aquarius';
        break;
      case 2:
        _zodiacSign = (day < 19) ? 'Aquarius' : 'Pisces';
        break;
      case 3:
        _zodiacSign = (day < 21) ? 'Pisces' : 'Aries';
        break;
      case 4:
        _zodiacSign = (day < 20) ? 'Aries' : 'Taurus';
        break;
      case 5:
        _zodiacSign = (day < 21) ? 'Taurus' : 'Gemini';
        break;
      case 6:
        _zodiacSign = (day < 21) ? 'Gemini' : 'Cancer';
        break;
      case 7:
        _zodiacSign = (day < 23) ? 'Cancer' : 'Leo';
        break;
      case 8:
        _zodiacSign = (day < 23) ? 'Leo' : 'Virgo';
        break;
      case 9:
        _zodiacSign = (day < 23) ? 'Virgo' : 'Libra';
        break;
      case 10:
        _zodiacSign = (day < 23) ? 'Libra' : 'Scorpio';
        break;
      case 11:
        _zodiacSign = (day < 22) ? 'Scorpio' : 'Sagittarius';
        break;
      case 12:
        _zodiacSign = (day < 22) ? 'Sagittarius' : 'Capricorn';
        break;
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: MyHeartDrawer(),
      appBar: AppBar(title: Text("Zodiac Signs")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Zodiac Signs',
              style: TextStyle( fontSize: 25),
            ),
            ElevatedButton(
              onPressed: (){
                _selectDate(context);
              },
              child: Text('Select Date'),
            ),
            if (_zodiacSign != null)
              Text(
                'Your zodiac sign is: $_zodiacSign',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
