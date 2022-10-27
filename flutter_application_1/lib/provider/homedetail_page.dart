import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomeDetailPage extends StatelessWidget {
  final ProductModel e;
  HomeDetailPage(this.e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeDetailPage')),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              e.image.toString(),
              width: 400,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(150),
                child: Column(
                  children: [
                    Text(
                      e.title ?? "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "\$" + e.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    // Text(
                    //   e.category.toString(),
                    //   style:
                    //       TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    // ),
                    Text(
                      e.description ?? "",
                      style: TextStyle(fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ButtonBar(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('ADD TO CART'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal[400],
                                onPrimary: Colors.white,
                                minimumSize: Size(150, 60),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.remove),
                        Icon(Icons.add),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Text(
      //       e.category.toString(),
      //     ),
      //     Image.network(
      //       e.image.toString(),
      //       width: 300,
      //     )
      //   ],
      // ),
    );
  }
}
