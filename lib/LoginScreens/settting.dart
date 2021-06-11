import 'package:flutter/material.dart';
final String appName = 'MCEC';
final String description = "Delivery App";
final String screenTitle = "Sign In to continue";

/**
 * Styling for Hint text in TextFormField
 */

final kHintTextStyle = TextStyle(
  color: Colors.purple.shade400,
  fontFamily: 'OpenSans',
);


/**
 * Label Style for User Typed Text in TextFormField
 */

final klabelStyle = TextStyle(
  color: Colors.red.shade600,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);


/**
 * Error Message for TexFormField Styling
 */

final kErrorStyle = TextStyle(
  color : Colors.deepPurple,
  fontSize : 12.0,
  fontStyle :FontStyle.italic,
  fontWeight : FontWeight.w700,
              
);


/**
 * TextFormField Box Style
 */


final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFfad57f),
  borderRadius: BorderRadius.circular(9.0),
  boxShadow: [
    BoxShadow(
      color: Colors.red,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);


/**
 * TextFormFiled Border Styling
 */
final kBorderStyle = OutlineInputBorder(
    borderSide : BorderSide (color: Colors.deepPurple, width : 2.0),
    borderRadius: BorderRadius.circular(10.0),
    
);
