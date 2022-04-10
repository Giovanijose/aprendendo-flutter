import 'package:flutter/material.dart';
import 'package:navegacao/one_page.dart';
import 'package:navegacao/two_page.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const OnePage(),
        '/twoPage': (_) => const TwoPage()
      },
    );
  }
}