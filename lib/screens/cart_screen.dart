import 'package:flutter/material.dart';
import '../data/data.dart'

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length, 
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Text('hello $index'),
          );
        },
      )
    );
  }
}
