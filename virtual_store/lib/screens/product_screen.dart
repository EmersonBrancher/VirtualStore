import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Color.fromRGBO(114, 95, 105, 100),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: false,
                aspectRatio: 1,
              ),
              items: product.images.toList().map((url) => ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )).toList(),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                  Text(
                    "R\$${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(),
                ],
              ),
          ),
        ]
      ),
    );
  }
}