import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/LoginScreens/ZoomScreen/item.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
// This is the product data that is recieved from
// the previous screen
  dynamic data;

// Constructor
  ProductDetails(dynamic data) {
    this.data = data;
  }

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery Screen Data to keep balance between the height used for screen
    // and other stuff
    var screenData = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF304661),
        centerTitle: true,
        title: Text(
          widget.data.getName().toString(),
          style: TextStyle(fontFamily: "Pattaya", fontWeight: FontWeight.w500),
        ),
      ),

      // Body Contains the scrollable ListView which has many components
      // defined based on what parameters we recive as data. Starting from
      // Product Image to Proudct Description. Now if in future one needs to increase
      // the the properties dislayed one can easily append it to the children of ListView

      body: ListView(
        children: <Widget>[
          // Product Image Container with the height 40% of the screen height

          //*************************** TODO IMPLEMENTATION FOR ZOOM SCREEN HERE IN THIS CONTAINER ***************************/
          Container(
              height: screenData.height * 0.4,
              padding: EdgeInsets.zero,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => itemPage()));
                },
                child: Image.asset(
                  widget.data.getImage().toString(),
                  fit: BoxFit.cover,
                ),
              )),

          // Product Name container
          Container(
            margin: EdgeInsets.only(top: 10.0, left: 10.0),
            child: Text(widget.data.getName().toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto Regular",
                    fontStyle: FontStyle.italic,
                    color: Colors.black)),
          ),

          // Proudct Prices and discount related Container build in one Column
          Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rs ${widget.data.getPrice()}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.blue,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Rs ${widget.data.getNewPrice()}",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.red)),
                  SizedBox(width: 10),
                  Text("(${widget.data.getDiscount()}% off)",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.green.shade400,
                      ))
                ],
              )),

          // Product Short Description Container. It contains
          // a short catchy proudct description
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Text(widget.data.getshortDesc().toString(),
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Sans Seriff")),
          ),

          SizedBox(height: 25.0),

          // Row Widget for 3 dropDown buttons namely (size, Color, Qty)

          Row(children: <Widget>[
            // Size Drop Down Button
            Expanded(
              child: MaterialButton(
                // *********** On Press Event Function ***********
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.grey.shade800,
                elevation: 0.5,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Size")),
                    Expanded(child: Icon(Icons.arrow_drop_down_circle)),
                  ],
                ),
              ),
            ),

            // Color drop down Button
            Expanded(
              child: MaterialButton(
                // *********** On Press Event Function ***********
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.grey.shade800,
                elevation: 0.5,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Color")),
                    Expanded(child: Icon(Icons.arrow_drop_down_circle)),
                  ],
                ),
              ),
            ),

            // Quantity Drop Down Button
            Expanded(
              child: MaterialButton(
                // *********** On Press Event Function ***********
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.grey.shade800,
                elevation: 0.5,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Qty.")),
                    Expanded(child: Icon(Icons.arrow_drop_down_circle)),
                  ],
                ),
              ),
            ),
          ]),

          SizedBox(height: 30),

          // Title container
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Proudct Description",
              style: TextStyle(
                fontFamily: "Times",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),

          /// Proudct Long Description
          Container(
            padding: EdgeInsets.only(left: 10.0, top: 12.0),
            child: Text(
              "${widget.data.getlongDesc()}",
              style: TextStyle(
                fontFamily: "Arial",
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),

      // Bottom App Bar It contains two static buttons on the screen
      /// One for Buy Now and Another for Add To cart
      /// TODO :- implement the onPressed event

      bottomNavigationBar: BottomAppBar(
          child: Row(children: [
        Expanded(
          child: ElevatedButton(
            // ************** On Pressed Event *****************
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Expanded(child: Text("Buy Now")),
                Expanded(child: Icon(Icons.monetization_on_outlined)),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              elevation: MaterialStateProperty.all(5.0),
              fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide()),
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            // ****************** On Pressed Event **************
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Expanded(child: Text("Add to Cart")),
                Expanded(child: Icon(Icons.shopping_cart_sharp)),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              elevation: MaterialStateProperty.all(5.0),
              fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide()),
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
