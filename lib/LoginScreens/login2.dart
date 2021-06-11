import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern/main.dart';
import 'package:intern/LoginScreens/setting2.dart';


/**
 * All the Setting files are loaded in setting2.dart
 */

class Login_ extends StatefulWidget {
  @override
  _Login_State createState() => _Login_State();
}

class _Login_State extends State<Login_> {

  final TextEditingController __emailController = TextEditingController();
  final TextEditingController __pswrdController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;


  Widget __emailWidget() {
    return Container (
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child : TextFormField (
          controller: __emailController,

      /**
       * Validator function for Email Widget
       */
          validator: (value) {
            if(value == null || value.isEmpty) {
              return'*required';
            }
            return null;
          },

          keyboardType: TextInputType.emailAddress,
          style : TextStyle(
            color : Colors.white,
            fontFamily : "OpenSans",
          ),
          decoration: InputDecoration(
            border : InputBorder.none,
            errorStyle: kErrorStyle,
            contentPadding: EdgeInsets.only(
              top : 15.0,
              left : 3.0,
            ),
            prefixIcon: Icon(
              Icons.email,
              color : Colors.white,
            ),
            hintText : "Email Address",
            hintStyle: kHintTextStyle
          ),
        )
    );
  }
  Widget __pswrdWidget() {
    return Container (
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height : 60.0,
      child: TextFormField(

          controller: __pswrdController,

        /**
         * Validator function for password
         */
          validator: (value) {
            if(value == null || value.isEmpty) {
              return '*required';
            }
            return null;
          },

          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          style : TextStyle(
            color : Colors.white,
            fontFamily : "OpenSans",
          ),
          decoration: InputDecoration(
            border : InputBorder.none,
            errorStyle: kErrorStyle,
            contentPadding: EdgeInsets.only(
              top : 15.0,
              left : 3.0,              
            ),
            prefixIcon : Icon (
              Icons.lock,
              color : Colors.white,
            ),
            hintText: "Password",
            hintStyle: kHintTextStyle
          ),
        ),
    );
  
  }
  Widget __loginbtnWidget() {
    return Container(
        padding : EdgeInsets.symmetric(vertical : 35.0),
        width : 200,
        child : ElevatedButton (

        /**
         * On Press event for login Button
         */
          onPressed: () {
            if(_formkey.currentState!.validate()) {
                Navigator.push(context, MaterialPageRoute(
                  builder : (context) => MyHomePage(title: "Hello World",),
                ));
            } else {
              setState(() => _autoValidate = true );
            }
          },


          style: ButtonStyle (
            backgroundColor: MaterialStateProperty.all<Color> (Colors.white),
            elevation: MaterialStateProperty.all(5.0),
            shape : MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )
            )
          ),
          child : Text(
            "LOGIN",
            style: TextStyle(
              color: Colors.indigo.shade600,
              fontFamily: "Times",
              letterSpacing: 1.5,
              fontSize : 18.0,
            ),
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value : SystemUiOverlayStyle.light,
          child : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack (
              children: <Widget> [
                Container(
                  height : double.infinity,
                  width : double.infinity,
                  decoration : BoxDecoration (
                    gradient : LinearGradient(
                      begin : Alignment.topLeft,
                      end : Alignment.bottomRight,
                      colors : [
                        Colors.orange.shade100,
                        Colors.pink.shade600,
                      ],
                    )
                  )
                ),

                Container (
                  height : double.infinity,
                  padding : EdgeInsets.only(
                    top : 80.0,
                    left : 40.0,
                    right : 40.0,

                  ),
                  child : SingleChildScrollView(
                    child : Form(
                      key : _formkey,
                      autovalidate: _autoValidate,
                      child : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children :[
                          Text(
                            appName,
                            style : TextStyle(
                                fontFamily: "Georgia",
                                fontSize : 45.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                                color : Colors.indigo.shade800,
                            )
                          ),
                          SizedBox(height : 15.0),
                          Text(
                            description,
                            style : TextStyle(
                              fontFamily: "Pattaya",
                              fontSize : 20.0,
                              letterSpacing: 2.0,
                              color: Colors.blue.shade600,
                            )
                          ),
                          SizedBox(height : 22.0),
                          Text(
                            screenTitle,
                            style : TextStyle(
                              fontFamily: "Serif",
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              fontSize : 16.0,
                              color : Colors.indigo.shade600,
                              letterSpacing: 1.2,
                            )
                          ),
                          SizedBox(height : 50.0),
                          __emailWidget(),
                          SizedBox(height : 25.0),
                          __pswrdWidget(),
                          __loginbtnWidget(),
                        ]
                      )
                    )
                  ) 
                
                )
              ],
            ),
          )
        ),
    );
  }
}