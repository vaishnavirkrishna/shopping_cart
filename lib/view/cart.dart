import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';

import 'package:flutter_application_1/view/bottomnav.dart';
import 'package:flutter_application_1/view/cartwidget.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  Cart({Key? key, required this.cartPrice, this.singlePrice, this.cartTitle});
  int? cartPrice;
  int? singlePrice;
  String? cartTitle;

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyScreenProvider>(context);
    List<CartItem> itemsCart = myProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text("Cart Page"),
      ),
      body: ListView.builder(
        itemCount: itemsCart.length,
        itemBuilder: (context, index) {
          final item = itemsCart[index];
          return CartWidget(
            titleCart: item.titles,
            index: index,
            item: item,
            priceCart: cartPrice,
            priceSingle: singlePrice,
          );
        },
      ),
      bottomNavigationBar: CartTotalPriceWidget(),
    );
  }
}
