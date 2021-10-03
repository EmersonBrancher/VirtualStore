import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:virtual_store/datas/product_data.dart';

class ProductScreen extends StatefulWidget {

  final ProductData product;

  String size;

  ProductScreen(this.product, this.size);

  @override
  _ProductScreenState createState() => _ProductScreenState(product, size);
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductData product;

  _ProductScreenState(this.product, String size);

  Object? get size => null;

  set size(size) {}

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
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Tamanho",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 34.0,
                    child: GridView(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5,
                      ),
                      children: product.sizes.map(
                              (s){
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      size = s;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                      border: Border.all(
                                        color: s == size ? Colors.green : Colors.grey,
                                        width: 3.0
                                      ),
                                    ),
                                    width: 50.0,
                                    alignment: Alignment.center,
                                    child: Text(s),
                                  ),
                                );
                              }
                              ).toList(),
                    ),
                  ),
                ],
              ),
          ),
        ]
      ),
    );
  }
}