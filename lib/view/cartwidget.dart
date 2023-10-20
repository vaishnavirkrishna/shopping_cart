import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';

import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  final CartItem item;
  List<CartItem> cartItems = [];
  int? priceCart;
  int? priceSingle;
  String? titleCart;

  int? index;
  CartWidget(
      {super.key,
      required this.index,
      required this.item,
      required this.priceCart,
      this.priceSingle,
      this.titleCart});

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyScreenProvider>(context);
    return Container(
      color: const Color.fromARGB(255, 178, 216, 135),
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      height: 130,
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
            )),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          //"Item ${index! + 1}",
                          titleCart.toString(),
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            print("Button Pressed");
                          },
                          color: Colors.red,
                          icon: InkWell(
                              onTap: () {
                                Provider.of<MyScreenProvider>(context,
                                        listen: false)
                                    .removeItem(index!);
                              },
                              child: const Icon(Icons.delete)),
                          iconSize: 20,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("SUBTOTAL"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(" ${item.price}"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Text(
                        "FREE DELIVERY",
                        style: TextStyle(color: Colors.orange),
                      ),
                      const Spacer(),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.redAccent.shade200,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: InkWell(
                                  onTap: () {
                                    myProvider.removeCounter();
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.redAccent,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(myProvider.value.toString()),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.lightBlue,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: InkWell(
                                  onTap: () {
                                    myProvider.addCounter();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
