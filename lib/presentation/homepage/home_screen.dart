import 'package:ecommerce/domain/modals/modal.dart';
import 'package:ecommerce/presentation/homepage/widgets/home_appbar.dart';
import 'package:ecommerce/presentation/itempage/item_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // list of some categories..
  final List categories = [
    "Bags",
    "Foot Wear",
    "Watchs",
    "Jewellery",
    "Clothes",
    "Fav",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: HomeAppbar(categories: categories)),
      // grid of items / products

      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: productsDetails.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.3,
        ),
        itemBuilder: (context, index) {
          return _buildProductTile(index, context);
        },
      ),
    );
  }

  ClipRRect _buildProductTile(int index, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemScreen(
              backgroundColor: productsDetails[index][4],
              index: index,
            ),
          ));
        },
        // product tile/box
        child: Container(
          padding: const EdgeInsets.all(10),
          color: productsDetails[index][4],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              Hero(
                tag: index,
                child: Image.asset(
                  productsDetails[index][3],
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              //  name and price -/
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name
                  Text(
                    productsDetails[index][0],
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.65),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Price ${productsDetails[index][2].toString()} -/ ",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
