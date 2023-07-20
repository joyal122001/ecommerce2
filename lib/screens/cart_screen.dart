import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Your shopping cart"),),
    body: Center(child: Text("Your shopping cart is empty",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w400),)),);
  }
}
