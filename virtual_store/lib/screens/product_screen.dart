import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:virtual_store/datas/product_data.dart';

class ProductScreen extends StatefulWidget {

  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductData product;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
            ),
            items: product.images.toList().map((e) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(e,
                  width: 100,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            )).toList(),
          ),
        ]
      ),
    );
  }
}