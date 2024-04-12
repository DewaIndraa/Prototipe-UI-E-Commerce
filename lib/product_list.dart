import 'package:flutter/material.dart';
import 'package:flutter_project/ApiService.dart';

import 'model/product_model.dart';
import 'widgets/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [];
  bool loading = true;
  void initState() {
    getProducts();
    super.initState();
  }

  getProducts() async {
    final data = await APIService.getProduct();
    products = data;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text(
            'Products List',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductWidget(
                          product: product,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
