import 'dart:io';
import 'package:wall/screens/home_screen3_11.dart';
import 'screens/home_screen3_11.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wall/utilities/colors.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: HomeScreen(),
//       ),
//       title: 'Image Picker',
      
//       // home: const MyHomePage(title: 'Wall Artist'),
//     );
//   }
// }






void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: 
        //MyHomePage(title: "wall",),
        HomeScreen(),
        
      ),
    );
  }
}