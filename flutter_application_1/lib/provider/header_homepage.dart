import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/provider/productlist_page.dart';
import 'package:provider/provider.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    List<String> Category = ['Trang sức', 'Đồ thời trang ', 'Đồ công nghệ'];
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.deepOrange),
            padding: EdgeInsets.only(left: 30, top: 30, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Digit Shop',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 300,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'SearchSomeThing',
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 50,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.deepOrange,
            padding: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...Category.map(
                  (e) => Container(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      e,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: ProductListPage())
        ],
      ),
    );
  }
}
