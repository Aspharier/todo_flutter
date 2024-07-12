import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_flutter/splash_screen.dart';
import 'pages/home_page.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();
  
  // open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.brown,
        textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme,),
      ),
    );
  }
}
