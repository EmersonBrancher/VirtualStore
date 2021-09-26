import 'package:flutter/material.dart';
import 'package:virtual_store/tabs/home_tab.dart';
import 'package:virtual_store/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(),
        ),
      ],
    );
  }
}
