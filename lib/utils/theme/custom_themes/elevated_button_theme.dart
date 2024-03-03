import 'package:flutter/material.dart';

class TElevatedButton{
 TElevatedButton._();
 static final ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
   elevation: 0,
   foregroundColor: Colors.white,
   backgroundColor: Colors.blue,
   disabledBackgroundColor: Colors.grey,
   disabledForegroundColor: Colors.grey,
   side: const BorderSide(color: Colors.blue),
   padding: const EdgeInsets.symmetric(vertical: 18),
   textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

  ),
 );

 static final ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.black,
    backgroundColor: const Color(0xFFC16F3D),
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
    side: const BorderSide(color: Color(0xFFC16F3D)),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
 )


 );
}