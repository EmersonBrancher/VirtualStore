import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:virtual_store/datas/product_data.dart';
import 'package:virtual_store/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.get("title")),
            centerTitle: true,
            bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.grid_on),),
                  Tab(icon: Icon(Icons.list),),
                ]
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection("products").doc(snapshot.id).collection("items").get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
              } else {
                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              "grid", ProductData.fromDocument(snapshot.data!.docs.single));
                        }
                    ),
                    ListView.builder(
                        padding: EdgeInsets.all(4.0),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              "list", ProductData.fromDocument(snapshot.data!.docs.single));
                        }
                    ),
                  ],
                );
              }
            },
          ),
        ),
    );
  }
}
