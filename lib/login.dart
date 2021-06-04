import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/main.dart';
import 'package:intern/settting.dart';
import 'package:flutter/services.dart';
import 'package:intern/home.dart';

/**
 * All the setting file are loaded in setting.dart
 */

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

    final TextEditingController __emailController = TextEditingController();
    final TextEditingController __pswrdController = TextEditingController();
    final _formkey = GlobalKey<FormState>();
    bool _autoValidate = false;

  /**
   * Returns a custom Email Widget
   * 
   * To change BoxDecoration settings and 
   * Form Field settins refer settings.dart.
   * 
   * Controller : _emailController
   */

    Widget __emailWidget () {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Email",
            style: klabelStyle,
          ),
          SizedBox(height: 10.0,),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child : TextFormField(
              
              controller: __emailController,

            /* Email Validator Function */
              validator: (value) {
                  if(value == null || value.isEmpty) {
                    return '*required';
                  }
                  return null;
              },

              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color : Colors.deepPurple,
                fontFamily: "OpenSans",
              ),
              decoration: InputDecoration(
                errorStyle: kErrorStyle,
                border: InputBorder.none,
                focusedBorder: kBorderStyle,
                enabledBorder: kBorderStyle,
                suffixIcon: Icon(
                  Icons.email,
                  color : Colors.deepPurpleAccent,
                ),
                hintText: "Enter you Email",
                hintStyle: kHintTextStyle
              ),
            )
          )
        ],
      );
    }

  /**
   * Returns Custom Password Widget
   * To change BoxDecoration settings and
   * Form Field settings refer settings.dart
   * 
   * Controlller : _pwrdController
   */

    Widget __pswrdWidget () {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Password",
            style: klabelStyle,
          ),
          SizedBox(height: 10.0,),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child : TextFormField(
    
              controller: __pswrdController,

            /* Validator Function for Password */
              validator: (value) {
                  if(value == null || value.isEmpty) {
                    return '*required';
                  } 
                  return null;
              },

              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(
                color : Colors.deepPurple,
                fontFamily: "OpenSans",
              ),
              
          
              decoration: InputDecoration(
                
                errorStyle: kErrorStyle,
                border : InputBorder.none,
                focusedBorder: kBorderStyle,
                enabledBorder: kBorderStyle,
                suffixIcon: Icon(
                  Icons.lock,
                  color : Colors.deepPurpleAccent,
                ),
                hintText: "Enter you Password",
                hintStyle: kHintTextStyle
              ),
            )
          )
        ],
      );
    }

  /**
   * Returns Custom Login Button Widget
   */

    Widget __loginbtnWidget() {
      return Container(
          padding : EdgeInsets.symmetric(vertical : 25.0,),
          width: 200,
          child : ElevatedButton(
          /**
           * On Press Event for Login Button
           */
            onPressed: (){
                if(_formkey.currentState!.validate()) {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder : (context) => Home()
                    ));
                } else {
                  setState(() => _autoValidate = true);
                }
            },

            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9f7afa)),
                elevation: MaterialStateProperty.all(5.0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side : BorderSide()
                  )
                ) 
            ),
            child: Text(
              "LOGIN",
              style : TextStyle(
                color : Colors.white,
                letterSpacing : 1.5,
                fontSize : 18.0,
                fontWeight : FontWeight.bold,
                fontFamily : "Times"
              )
            ),
          )
      );
    }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle> (
            value: SystemUiOverlayStyle.light,
            child : Stack(
              children : <Widget> [
                Container (
                  height : double.infinity,
                  width : double.infinity,
                  decoration : BoxDecoration (
                    gradient : LinearGradient (
                      begin : Alignment.topCenter,
                      end : Alignment.bottomCenter,
                      colors: [
                        Color(0xFFf5edb5),
                        Color(0xFFf7e986),
                        Color(0xFFf7e565),
                        Color(0xFFf7e24a)
                      ],
                      stops : [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),


                Container(
                  height: double.infinity,
                  child : SingleChildScrollView(
                    physics : AlwaysScrollableScrollPhysics(),
                  /*   padding : EdgeInsets.symmetric(horizontal: 40.0, vertical : 120.0), */

                    child : Stack(
                      children: [
                        Image.asset("assets/background.svg"),

                        /* Container is implemented to add symmetric padding */
                        Container( 
                          padding : EdgeInsets.symmetric(horizontal : 40.0, vertical : 120.0),
                          child : Form(
                            key : _formkey,
                            autovalidate: _autoValidate,
                            child : Column (
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                Text (
                                  appName,
                                  style : TextStyle (
                                    fontFamily: "Georgia",
                                    fontSize : 40.0,
                                    fontWeight : FontWeight.bold,
                                    letterSpacing: 2.0,
                                  )
                                ),
                                SizedBox(height : 15.0),
                                Text (
                                  description,
                                  style: TextStyle(
                                    fontFamily: "Pattaya",
                                    fontSize : 24.0,
                                    fontWeight : FontWeight.w300,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                SizedBox(height: 15.0,),
                                Text (
                                  screenTitle,
                                  style : TextStyle(
                                    fontFamily : "Serif",
                                    fontSize : 14,
                                    fontWeight: FontWeight.w200,
                                    fontStyle: FontStyle.italic
                                  ),
                                ),
                                SizedBox(height: 30.0,),
                                __emailWidget(),
                                SizedBox(height: 30.0,),
                                __pswrdWidget(),
                                __loginbtnWidget(),
                              ],
                            ),
                          ),
                           
                        ),
                        
                    ],),
                    
                  ),
                )
              ]
            )         
          )
      );
  }
}


