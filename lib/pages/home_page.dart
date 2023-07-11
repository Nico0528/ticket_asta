import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_asta/components/cube.dart';
import 'package:ticket_asta/pages/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<Widget> pages = [];
  int _dimension = 0;
  getData() async {
    var res = await http
        .get(Uri.https('647b6518d2e5b6101db13f54.mockapi.io', '/products'));
    var dataJson = jsonDecode(res.body);
    for (var u in dataJson) {
      Product product = Product(u["name"], u["bet"], u["deadline"], u["image"]);
      ProductPage page = ProductPage(u["image"]);
      products.add(product);
      pages.add(page);
    }
    setState(() {
      _dimension = products.length;
    });
  }

  refresh() {
    products.clear();
    pages.clear();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 133, 125),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'TicketAsta',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Icon(
                  FeatherIcons.gift,
                  color: Colors.white,
                  size: 45,
                ),
              ],
            ),
            SizedBox(
              height: 230,
              width: MediaQuery.of(context).size.width * 0.90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _dimension,
                itemBuilder: (context, index) {
                  return cube(
                    products[index].name,
                    products[index].bet,
                    products[index].deadline,
                    products[index].image,
                    context,
                    pages[index],
                  );
                },
              ),
            ),
            ElevatedButton(onPressed: refresh, child: Text('refresh'))
          ],
        ),
      ),
    );
  }
}

class Product {
  String name, deadline, image;
  int bet;
  Product(
    this.name,
    this.bet,
    this.deadline,
    this.image,
  );
}
