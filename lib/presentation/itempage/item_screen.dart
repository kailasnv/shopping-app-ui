import 'package:ecommerce/domain/modals/modal.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemScreen extends StatelessWidget {
  final Color backgroundColor;
  final int index;
  ItemScreen({
    super.key,
    required this.backgroundColor,
    required this.index,
  });
  // cart stuffs
  ValueNotifier<int> numberOfItemsNotif = ValueNotifier(0);
  ValueNotifier<bool> isLikedNotif = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  Stack _buildBody() {
    return Stack(
      children: [
        /* stack is used to place  image on top of all */

        // body part
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // name
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(productsDetails[index][0],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
            ),
            // price section
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 200, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Price",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text("\$ ${productsDetails[index][2].toString()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                ],
              ),
            ),
            // other details and order section ..
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(
                  top: 70, bottom: 30, left: 30, right: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              // contents
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // select color and size section
                  _selectColorAndSizePart(),
                  const SizedBox(height: 15),
                  // description / about of product
                  Text(
                    productsDetails[index][1],
                    style: const TextStyle(color: Colors.grey),
                  ),
                  // add to cart section  / adn fav button
                  _addToCartAndFavWidget(),
                  //
                  // Buy Now Button
                  GestureDetector(
                    onTap: () {},
                    child: _purchaseButton(),
                  ),
                ],
              ),
            )),
          ],
        ),

        // image
        Positioned(
          left: 140,
          right: 10,
          top: 125,
          child: Hero(
            tag: index,
            child: Image.asset(
              productsDetails[index][3],
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  /*
     A L L   M E T H O D S
 */
  Row _selectColorAndSizePart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // color
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Color", style: TextStyle(fontWeight: FontWeight.bold)),
            // 3 colors dots...
            Row(
              children: const [
                SizedBox(
                  height: 10,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle)),
                ),
                SizedBox(width: 5),
                SizedBox(
                  height: 10,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.purple, shape: BoxShape.circle)),
                ),
                SizedBox(width: 5),
                SizedBox(
                  height: 10,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.yellow, shape: BoxShape.circle)),
                ),
              ],
            )
          ],
        ),
        // size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Size", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("12 cm", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Container _purchaseButton() {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: productsDetails[index][4],
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
          child: Text("Buy Now",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
    );
  }

  Row _addToCartAndFavWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // add to cart
        Row(
          children: [
            IconButton(
                onPressed: () {
                  if (numberOfItemsNotif.value > 0) {
                    numberOfItemsNotif.value--;
                  }
                },
                icon: const Icon(Icons.remove)),
            ValueListenableBuilder(
              valueListenable: numberOfItemsNotif,
              builder: (context, value, child) =>
                  Text(numberOfItemsNotif.value.toString()),
            ),
            IconButton(
                onPressed: () {
                  if (numberOfItemsNotif.value < 10) {
                    numberOfItemsNotif.value++;
                  }
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        // Fav button / like product section
        ValueListenableBuilder(
            valueListenable: isLikedNotif,
            builder: (context, value, _) => IconButton(
                onPressed: () {
                  isLikedNotif.value = !isLikedNotif.value;
                },
                icon: Icon(Icons.favorite,
                    color: isLikedNotif.value ? Colors.red : Colors.grey))),
      ],
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
      ],
    );
  }
}
