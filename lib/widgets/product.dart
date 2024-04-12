import 'package:flutter/material.dart';
import 'package:flutter_project/model/product_model.dart';
import 'package:flutter_project/detail.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => DetailProduct(product: widget.product)),
        ),
      ),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.075), // Warna bayangan
              spreadRadius: 5, // Radius penyebaran bayangan
              blurRadius: 5, // Radius blur bayangan
              offset: const Offset(0, 4), // Posisi bayangan (x, y)
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.product.thumbnail,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333542),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            favorite = !favorite;
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          color:
                              favorite ? Color(0xFF333542) : Color(0xFFEEEEF2),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFF9CC4A),
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
                        widget.product.rating,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFF9CC4A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
