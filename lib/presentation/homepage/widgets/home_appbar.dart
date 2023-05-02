import 'package:flutter/material.dart';

import '../../core/colors.dart';

class HomeAppbar extends StatefulWidget {
  final List categories;
  const HomeAppbar({super.key, required this.categories});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,

      title: const Text("shopteen.",
          style: TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kBlack,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: kBlack,
            )),
      ],

      // bottom categories ..  in a  listview
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 45),
        child: SizedBox(
          height: 30,
          width: double.infinity,
          child: ListView.builder(
            itemCount: widget.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // each categories ...
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => setState(() {
                    selectedIndex = index;
                  }),
                  child: Column(
                    children: [
                      Text(
                        widget.categories[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == index
                                ? kBlack
                                : kBlack.withOpacity(0.5)),
                      ),
                      const SizedBox(height: 4),
                      Container(
                          width: 30,
                          height: 2,
                          color: selectedIndex == index
                              ? kBlack
                              : Colors.transparent)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
