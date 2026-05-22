import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/feature/widgets/my_heart_drawer.dart';
class BmiCalc extends StatefulWidget{
  const BmiCalc({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BmiCalcState createState() => _BmiCalcState();
}
class _BmiCalcState extends State<BmiCalc>{
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _bmiResult;
  void _calculateBmi() {
    final double height = double.tryParse(_heightController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        // Convert height from cm to m
        final double heightInMeters = height / 100;
        _bmiResult = weight / (heightInMeters * heightInMeters);
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: MyHeartDrawer(),
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'BMI Calculator',
              style: TextStyle( fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Height (cm)'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight (kg)'),
              ),
            ),
            ElevatedButton(
              onPressed: _calculateBmi,
              child: Text('Calculate BMI'),
            ),
            if (_bmiResult != null)
              Text(
                'Your BMI is: ${_bmiResult!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}