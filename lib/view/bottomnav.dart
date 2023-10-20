import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class CartTotalPriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyScreenProvider>(context);
    int totalCartPrice =
        myProvider.cartItems.fold(0, (total, item) => total + item.price);

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total Price: $totalCartPrice",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    const Color.fromARGB(255, 81, 134, 160))),
            onPressed: () {},
            child: Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
