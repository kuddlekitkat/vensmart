import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:testmanga/providers/ProductProvider.dart';

import '../models/product_response/product.dart';

class products extends StatefulWidget {
  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    List<Product> products = provider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ListTile(
            title: Text(product.storeName.toString()),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirmation"),
                          content: Text("Are you sure you want to delete?"),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      });
                },
              )
            ]),
          );
        },
      ),
    );
  }

  Future deleteProduct(Function callback, Product Product) async {
    await callback(Product);
    Navigator.pop(context);
  }
}
