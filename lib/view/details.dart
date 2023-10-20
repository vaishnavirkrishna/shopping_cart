import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:flutter_application_1/view/cart.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  Details(
      {super.key,
      required this.price,
      required this.imge,
      required this.title});
  int? price;
  String? imge;
  String? title;

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyScreenProvider>(context);
    String calculatedPrice = myProvider.totPrice(price!);

    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 121, 121),
        centerTitle: true,
        title: Text("DETAILS PAGE"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                imge!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                ),
                onPressed: () {},
                child: Text(
                  " Price:${price.toString()}",
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.purple,
                    height: 35,
                    width: 120,
                    child: Center(
                        child: Text(
                      "Total:${myProvider.totPrice(price!)}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                    height: 30,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            myProvider.addCounter();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.purple),
                          ),
                          child: Icon(Icons.add),
                        ),
                        Container(
                            width: 50,
                            child: Text(
                              myProvider.value.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        ElevatedButton(
                          onPressed: () {
                            myProvider.removeCounter();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.purple),
                          ),
                          child: Icon(Icons.minimize),
                        ),
                      ],
                    ))
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                myProvider.addToCart(imge!, int.parse(calculatedPrice), title!);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Cart(
                      cartTitle: title,
                      cartPrice: int.parse(calculatedPrice),
                      singlePrice: price,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
              ),
              child: Text("Add to cart", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
