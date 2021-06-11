// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intern/Product/ProductGrid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /**
   * Dynamic search Icon and appBarTitle
   * 
   * Whenever user's click on the search bar the appBartitle is replaced with the 
   * search bar and the searchIcon moves to the left side.
   */
  Icon _myIcon = Icon(Icons.search);
  Widget appBarTitle = new Text(
    "MCEC",
    style: TextStyle(
      fontFamily: "Pattaya", // MUST BE REFERRED IN PUBSPEC.YAML. SEE THE FONT DIRECTORY FOR FILE
      color: Colors.white,
    ),
  );

  // Returns custom searchBar

  Widget _searchBar() {
    return IconButton(
      icon: _myIcon,
    
    // On Press Event of search Bar, ony setState method has been written yet
    // in Future to modify the behaviour of this we have to edit here ****
      onPressed: () {
        setState(() {
          if (this._myIcon.icon == Icons.search) {
            this._myIcon = Icon(Icons.close);
            this.appBarTitle = TextField(
              style: new TextStyle(
                color: Colors.white,
              ),
              decoration: new InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white),
              ),
            );
          } else {
            this._myIcon = new Icon(Icons.search);
            this.appBarTitle = new Text("MCEC");
          }
        });
      },
    );
  }

  // Custom Shopping Widget which is embedded on an elevated Button
  Widget _shoppingWidget() {
    return ElevatedButton(
    
    // On Press event of this button MODIFY HERE FOR FUTRE ***
      onPressed: () {},
      child: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF304661)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: Color(0xFF304661),
        title: appBarTitle,
        centerTitle: true,
        actions: <Widget>[
          _searchBar(),
          _shoppingWidget(),
        ],
      ),
      body : Products(),
    );
  }
}

// Custome Side Bar, To input more items just extend the list.

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            "Side Menu",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Profile Setting"),
            onTap: () {})
      ],
    ));
  }
}

