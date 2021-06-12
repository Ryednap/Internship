import 'package:flutter/material.dart';

import 'package:intern/Product/ProductData.dart';
import 'package:intern/Product/ProductDetails.dart';

// ignore: must_be_immutable
class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
 
 // List of Product Data class that will be rendered into grid into the build function
 // Currently this is static but can be easily merged with JSON

  List<ProductData> prod = [
    ProductData("B&O Headphone", "Black Premium Quality Headphone B&O total Wireless",
                "Very Comfortable 2.4 GHz bandwidth\ntotal Wireless Headphone.\nAvailable in two Colors.",
                120, 3, "images/2headphone.jpeg"
              ),
    ProductData("B&O Headphone", "Black Premium Quality Headphone B&O total Wireless",
                "Very Comfortable 2.4 GHz bandwidth\ntotal Wireless Headphone.\nAvailable in two Colors.",
                120, 3, "images/2headphone.jpeg"
              ),
    ProductData("B&O Headphone", "Black Premium Quality Headphone B&O total Wireless",
                "Very Comfortable 2.4 GHz bandwidth\ntotal Wireless Headphone.\nAvailable in two Colors.",
                120, 3, "images/2headphone.jpeg"
              ),
    ProductData("B&O Headphone", "Black Premium Quality Headphone B&O total Wireless",
                "Very Comfortable 2.4 GHz bandwidth\ntotal Wireless Headphone.\nAvailable in two Colors.",
                120, 3, "images/2headphone.jpeg"
              ),
    ProductData("B&O Headphone", "Black Premium Quality Headphone B&O total Wireless",
                "Very Comfortable 2.4 GHz bandwidth\ntotal Wireless Headphone.\nAvailable in two Colors.",
                120, 3, "images/2headphone.jpeg"
              ),
    ProductData("B&O Headphone", "Black Premium Quality Headphone B&O total Wireless",
                "Very Comfortable 2.4 GHz bandwidth\ntotal Wireless Headphone.\nAvailable in two Colors.",
                120, 3, "images/2headphone.jpeg"
              ),

  ];
  

// Main GridView builder which calls SingleProduct to build each product
// individually this prevents hardcoding each products seperately and 
// creates a solution to just append into the Proudct List for it to be rendered here.
  @override
  Widget build(BuildContext context) {
    return Container(
      child : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 3),
        itemCount: prod.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(prod[index]);
        },
      )
    );
  }
}

// This class defines the styling and functionality of each individual product
// that will be returned to the GridView builder


// ignore: must_be_immutable
class SingleProduct extends StatelessWidget {

  ProductData data =  new ProductData("", "", '', 0.0, 0.0, "");

  SingleProduct (ProductData data) {
    this.data = data;
  }
  

  @override
  Widget build(BuildContext context) {
    return Card(
        child : Material(
          child : InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(this.data)));
            },
            child : GridTile(
              footer : Container(
                height: 50.0,
                color: Colors.white70,

// *****************************FIX*****************************************88
          /// Needs to design this:
          /// Currently if you render on the screen if the price is
          /// in greater than 3 figures then it will render to the next line
          /// which doesnot looks good. Fix this.
        
                child : ListTile(
                  leading: Text(this.data.getName().toString(), style : TextStyle(
                    fontFamily: "cursive",
                    fontWeight: FontWeight.w600,
                  )),
                  title: Text("Rs${this.data.getNewPrice()!}", style : TextStyle(
                    fontFamily: "cursive",
                    fontWeight: FontWeight.bold,
                    fontSize : 10,
                    color: Colors.red,
                  )),

                  subtitle: Text("Rs${this.data.getPrice()}", style : TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontWeight : FontWeight.bold,
                    color : Colors.black,
                  )),

                ),
              ),
              child : Image.asset(this.data.getImage().toString(), fit: BoxFit.cover,)
            )
          ),
        )
    );
  }
}
