import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

// my own imports
import 'package:myapp/componets/horizontal_listview.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/w3.jpeg'),
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.5,
        dotColor: Color(0xFFC8C8C8),
        indicatorBgPadding: 5.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Color(0xFFFF6164),
        title: Text('Shopapp'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xFFF1F3F6),
            ),
            onPressed: () {},
          ),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Color(0xFFF1F3F6),
              ),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
              accountName: Text('Santos epi'),
              accountEmail: Text('binomna_santos@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Color(0xFFC8C8C8),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFFF1F3F6),
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Color(0xFFFF6164)),
            ),
            //            body

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Color(0xFFC8C8C8)),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person, color: Color(0xFFC8C8C8)),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Color(0xFFC8C8C8)),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categoris'),
                leading: Icon(Icons.dashboard, color: Color(0xFFC8C8C8)),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Color(0xFFC8C8C8)),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Color(0xFF0C73EB),
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Color(0xFF69DFDB)),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //Image carousel
          imageCarousel,

          //Padding widget
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text('Categories'),
          ),

          //Horizontal list view begins
          HorizontalList(),
        ],
      ),
    );
  }
}
