import 'package:flutter/material.dart';
import 'package:quranapp/surahs.dart';


void main() {
  runApp(const ApiClass());
}
class ApiClass extends StatelessWidget {
  const ApiClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
backgroundColor:Colors.grey ,
          body: SurahPage()),
    );
  }
}
