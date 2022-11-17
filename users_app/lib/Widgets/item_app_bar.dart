import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/assistantMethods/cart_Item_counter.dart';

import '../main_screens/cart_screen.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  final String? sellerUID;

  MyAppBar({this.bottom, this.sellerUID});
  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      title: const Text(
        "KOKO",
        style: TextStyle(fontFamily: "Lobster", fontSize: 30),
      ),
      leading: IconButton(
        splashRadius: 20.0,
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => CartScreen(sellerUID: widget.sellerUID)));
              },
              icon: const Icon(Icons.shopping_cart),
              color: Colors.white,
              splashRadius: 20.0,
            ),
            Positioned(
              child: Stack(
                children: [
                  const Icon(
                    Icons.brightness_1,
                    size: 20,
                    color: Colors.brown,
                  ),
                  Positioned(
                    top: 3,
                    right: 4,
                    child: Center(
                      child: Consumer<CartItemCounter>(
                          builder: (context, counter, c) {
                        return Text(
                          counter.count.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
