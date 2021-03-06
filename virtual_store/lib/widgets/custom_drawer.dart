import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store/models/user_model.dart';
import 'package:virtual_store/screens/login_screen.dart';
import 'package:virtual_store/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _builDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(49, 22, 37, 10),
                Color.fromRGBO(114, 95, 105, 100),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          )
      ),
    );

    return Drawer(
      child:           Stack(
            children: [
            _builDrawerBack(),
            ListView(
              padding: EdgeInsets.only(
                left: 32.0,
                top: 30.0,
              ),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 16.0, 8.0),
                  height: 170.0,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 8.0,
                          left: 0.0,
                          child: Text("Brutal Kill",
                            style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),
                      Positioned(
                        left: 0.0,
                        bottom: 0.0,
                          child: Consumer<UserModel>(
                              builder: (context, user, model) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ol??, ${user.isLoggedIn() ? user.userData["name"] : ""  }  ",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        !user.isLoggedIn() ?
                                        "Entre ou cadastre-se >" :
                                        "Sair",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onTap: (){
                                        if (!user.isLoggedIn()) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => LoginScreen(),
                                            ),
                                        );
                                        } else {
                                          user.signOut();
                                        }
                                      },
                                    ),
                                  ],
                                );
                              }
                          ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                DrawerTile(Icons.home, "In??cio", pageController, 0),
                DrawerTile(Icons.list, "Produtos", pageController, 1),
                DrawerTile(Icons.location_on, "Lojas", pageController, 2),
                DrawerTile(Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
              ],
            ),
          ],
        ),
    );
  }
}
