import 'package:flutter/material.dart';
import 'package:flutter_project/cart.dart';

import 'model/product_model.dart';

class DetailProduct extends StatelessWidget {
  final Product product;
  const DetailProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          child: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 374,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333542),
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F9CC4A),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFF9CC4A),
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        product.rating,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFF9CC4A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xFF75788A),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Cart(product: product))));
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFF474A5C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.shopping_cart_checkout_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
