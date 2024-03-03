import 'package:flutter/material.dart';

class TCheckBoxTheme{
  TCheckBoxTheme._();

   static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
     checkColor: MaterialStateProperty.resolveWith((states) {
       if(states.contains(MaterialState.selected)){
         return Colors.white;
       }else{
         return Colors.transparent;
       }
     }),
     fillColor: MaterialStateProperty.resolveWith((states) {
       if(states.contains(MaterialState.selected)){
         return Colors.blue;
       }else{
         return Colors.transparent;
       }
     })
   );

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return const Color(0xFFC16F3D);
        }else{
          return Colors.transparent;
        }
      })
  );


}