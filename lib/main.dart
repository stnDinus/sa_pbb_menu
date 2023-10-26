import 'package:flutter/material.dart';
import 'package:sa_ppb_menu/data.dart';
import 'package:sa_ppb_menu/halaman_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HalamanMenu(menuImitasi: menuImitasi),
    );
  }
}
