import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/feature/widgets/my_heart_drawer.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: MyHeartDrawer(),
      appBar: AppBar(title: Text("Home space")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home Screen',
              style: TextStyle( fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                onPressed: (){
                  context.push('/zodiac');
                }
              , child: Text('go to zodiac screen', style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: (){
                  context.push('/age');
                }
              , child: Text('go to age screen', style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: (){
                  context.push('/bmi');
                }
              , child: Text('go to bmi screen', style: TextStyle(color: Colors.white)),
              ),
            )


          ],
        ),
      ),
    );
  }
}