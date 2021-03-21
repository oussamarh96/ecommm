import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 2,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt2.jpeg",
      "price": 50,
      "size": "M",
      "color": "Pink",
      "quantity": 1,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt2.jpeg",
      "price": 50,
      "size": "M",
      "color": "Pink",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(cart_prod_picture),
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                // ****** size P ***
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_size,
                    style: TextStyle(color: Color(0xFF47809D)),
                  ),
                ),

                // ****** color P ***

                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_color,
                    style: TextStyle(color: Color(0xFF47809D)),
                  ),
                ),
              ],
            ),

            // **** price P *****
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF47809D)),
              ),
            ),
          ],
        ),
        trailing:
        FittedBox(
          fit: BoxFit.fill,
          child:
          new Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up,color: Color(0xFF47809D)),iconSize: 40.0, onPressed: () {}),
              Text('$cart_prod_qty',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.arrow_drop_down,color: Color(0xFF47809D)),iconSize: 40.0, onPressed: () {}),

            ],
          ),
        ),
      ),
    );
  }
}
