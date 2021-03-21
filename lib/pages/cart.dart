import 'package:flutter/material.dart';

// my imports

import 'package:myapp/componets/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Color(0xFF64DAC4),
        title: Text('cart'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xFFF1F3F6),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: new Cart_products(),
      bottomNavigationBar: new Container(
        color: Color(0xFFF1F3F6),
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text("\$230"),
            )),
            Expanded(
              child: new MaterialButton(
                onPressed: () {},
                child: new Text(
                  "Check Out",
                  style: TextStyle(color: Color(0xFFF1F3F6)),
                ),
                color: Color(0xFF64DAC4),
              ),
            )
          ],
        ),
      ),
    );
  }
}
