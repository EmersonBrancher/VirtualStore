import 'package:flutter/material.dart';
import 'package:virtual_store/tabs/home_tab.dart';
import 'package:virtual_store/tabs/products_tab.dart';
import 'package:virtual_store/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          backgroundColor: Color.fromRGBO(114, 95, 105, 100),
        ),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
      ],
    );
  }
}
