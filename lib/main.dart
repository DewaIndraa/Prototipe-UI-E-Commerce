import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/ApiService.dart';
import 'package:flutter_project/Sqflite_order.dart';
import 'package:flutter_project/model/product_model.dart';
import 'package:flutter_project/product_list.dart';
import 'package:flutter_project/widgets/banner.dart';
import 'package:flutter_project/widgets/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF333542)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  List<Product> products = [];
  void initState() {
    getProducts();
    super.initState();
  }

  getProducts() async {
    final data = await APIService.getProduct();
    products = data;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          children: [
            const Text(
              'E-Commerce',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits_rounded),
              title: Text('API Products'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ProductList()),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text('CRUD SQFLite'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => SqfliteOrder()),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.manage_accounts),
              title: Text('Account'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Cooming Soon!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Cooming Soon!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Cooming Soon!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCFCFC),
        title: const Text('E-Commerce'),
        actions: [
          GestureDetector(
            onTap: () => print('search'),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.search_sharp,
                size: 32,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 36,
                      color: Color(0xFF333542),
                    ),
                    children: [
                      TextSpan(
                        text: 'Dewa!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Color(0xFF333542),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Good morning, welcome back',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xFF333542),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  BannerWidget(
                    image:
                        'https://images.unsplash.com/photo-1484807352052-23338990c6c6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    label: 'Premium \nMacbook Pro',
                  ),
                  BannerWidget(
                    image:
                        'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    label: 'Apple \nIphone',
                  ),
                  BannerWidget(
                    image:
                        'https://images.unsplash.com/photo-1636211993589-6daf32038bd1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    label: 'Slim \nUltrabook',
                  ),
                  BannerWidget(
                    image:
                        'https://images.unsplash.com/photo-1640955014216-75201056c829?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    label: 'Gaming \nLaptop',
                  ),
                  BannerWidget(
                    image:
                        'https://images.unsplash.com/photo-1598327106026-d9521da673d1?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    label: 'Flagship \nSmartphone',
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF333542),
                  ),
                ),
              ],
            ),
          ),
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
