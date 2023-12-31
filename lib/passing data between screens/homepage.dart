import 'package:flutter/material.dart';

import 'detailspage.dart';
import 'dummy data.dart';

void main() {
  runApp(MaterialApp(
    home: ProductHome(),
    routes: {
      'details' :(context) => ProductDetails()
    },
  ));
}

class ProductHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Now"),
      ),
      body: ListView(
        children: products.map((e) => Card(
                  child: ListTile(
                    leading: Container(
                      height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: NetworkImage(e['image1'])))),
                    title: Text(e['name']),
                    subtitle: Text('\$ ${e['price']}'),
                    onTap: (){
                      gotoNextPage(context,e['id']);
                    },
                  ),
                ))
            .toList(),
      ),
    );
  }

  void gotoNextPage(BuildContext context, productId) { // productId = e['id]
    Navigator.pushNamed(context, 'details',arguments: productId);
  }
}
