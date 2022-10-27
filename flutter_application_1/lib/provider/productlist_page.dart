import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'homedetail_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // ViewType _viewType = ViewType.gridview;
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Scaffold(
      // appBar: AppBar(centerTitle: true, actions: [
      //   IconButton(
      //     onPressed: () {
      //       if (_viewType == ViewType.ListView) {
      //         _viewType = ViewType.gridview;
      //       } else {
      //         _viewType = ViewType.ListView;
      //       }
      //       setState(() {});
      //     },
      //     icon: Icon(
      //         _viewType == ViewType.ListView ? Icons.grid_on : Icons.view_list),
      //   ),
      // ]),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: (200 / 140),

        //body: ListView(
        children: [
          ...pp.list.map((e) {
            return Card(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      e.title ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                  ),
                  InkWell(
                    child: Image.network(
                      e.image.toString(),
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeDetailPage(e)));
                    },
                  ),
                  Container(
                    child: Text(
                      "\$" + e.price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= 5; i++)
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 30,
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonBar(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('ADD TO CART'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal[400],
                              onPrimary: Colors.white,
                              padding: EdgeInsets.all(10),
                              minimumSize: Size(120, 60),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList()
        ],
      ),

      //  scrollDirection: Axis.vertical,
    );
  }
}

//enum ViewType { gridview, ListView }
