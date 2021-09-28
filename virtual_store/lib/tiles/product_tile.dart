import 'package:flutter/material.dart';
import 'package:virtual_store/datas/product_data.dart';

class ProductTile extends StatelessWidget {

  late final String type;
  late final ProductData product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: type == "grid" ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 0.8,
                child: Image.network(
                  product.images.elementAt(0),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                            product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "R\$ ${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Theme.of(context).primaryColor,
                        ),
                        ),
                      ],
                    ),
                  ),
              ),
            ],
          )
          : Row()
      ),
    );
  }
}

