import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/image.dart';
import 'package:flutter_application_1/view/cart.dart';
import 'package:flutter_application_1/view/details.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int? prs;
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("HOME PAGE"),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Cart(
                  cartPrice: prs,
                ),
              ),
            ),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 14.0,
            children: <Widget>[
              Chip(
                label: Text("All"),
              ),
              Chip(
                label: Text("Women"),
              ),
              Chip(
                label: Text("Man"),
              ),
              Chip(
                label: Text("kids"),
              ),
              Chip(
                label: Text("Fashion"),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: imgList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Details(
                        price: price[index],
                        imge: imgList[index],
                        title: names[index],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            height: 200,
                            bottom: 50,
                            child: Container(
                              child: Image.network(
                                imgList[index],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Positioned(
                              left: 25,
                              bottom: 25,
                              child: Text(
                                names[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                            bottom: 10,
                            left: 25,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("₹ " + price[index].toString(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
