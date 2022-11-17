import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:seller_shop/Widgets/items_design.dart';
import 'package:seller_shop/Widgets/text_widget_header.dart';
import 'package:seller_shop/model/items.dart';
import 'package:seller_shop/uploadScreens/items_upload_screen.dart';

import '../Widgets/my_drawer.dart';
import '../Widgets/progress_bar.dart';
import '../global/global.dart';
import '../model/menus.dart';

class ItemsScreen extends StatefulWidget {
  final Menus? model;
  ItemsScreen({
    this.model,
  });

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              colors: [
                Colors.white54,
                Colors.brown,
              ],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Text(
          sharedPreferences!.getString("name")!,
          style: const TextStyle(fontFamily: "Lobster", fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => ItemsUploadScreen(model:widget.model)));
            },
            icon: const Icon(Icons.post_add),
            color: Colors.white,
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: false,
            delegate: TextWidgetHeader(
                title: "My " + widget.model!.menuTitle.toString() + " Items"),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("sellers")
                .doc(sharedPreferences!.getString("uid"))
                .collection("menus").doc(widget.model!.menuID).collection("items").orderBy("publishedDate",descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(
                      child: Center(child: circularProgress()),
                    )
                  : SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 1,
                      staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
                      itemBuilder: (context, index) {
                        Items smodel = Items.fromJson(snapshot.data!.docs[index]
                            .data()! as Map<String, dynamic>);
                        return ItemsDesignWidget(
                          model: smodel,
                          context: context,
                        );
                      },
                      itemCount: snapshot.data!.docs.length);
            },
          )
        ],
      ),
    );
  }
}
