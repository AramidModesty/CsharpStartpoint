import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class MyHeartDrawer extends StatelessWidget{
  const MyHeartDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('health drawer', style: TextStyle(fontSize: 25, color: Colors.white),),
          ),
          ListTile(
            title: Text('Home'),
            onTap: (){
              Navigator.pop(context);
              context.go('/');
            },
          ),
          ListTile(
            title: Text('Age'),
            onTap: (){
              Navigator.pop(context);
              context.go('/age');
            },
          ),
          ListTile(
            title: Text('Zodiac'),
            onTap: (){
              Navigator.pop(context);
              context.go('/zodiac');
            },
          ),
          ListTile(
            title: Text('BMI'),
            onTap: (){
              Navigator.pop(context);
              context.go('/bmi');
            },
          )
        ],
      ),
    );
  }
}