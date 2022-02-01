import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_portal/models/products.dart';

import 'cart_item_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();
  var totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        toolbarHeight: 100.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black12)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
                      fontSize: 16),
                ),
                Text(
                  '${NumberFormat.simpleCurrency(locale: 'en_US', name: 'INR').currencySymbol} $totalAmount',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                  key: ValueKey(totalAmount),
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              switchInCurve: Interval(0.70, 1, curve: Curves.easeInExpo),
              switchOutCurve: Interval(0.10, 1, curve: Curves.easeInExpo),
              child: cart.length == 0
                  ? Text('Add something to cart to proceed',
                      style: TextStyle(fontFamily: 'Montserrat'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          minimumSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width, 50))),
                      onPressed: () {},
                      child: Text(
                        'CONTACT OWNERS',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.white),
                      )),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cart',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              switchInCurve: Interval(0.70, 1, curve: Curves.easeInExpo),
              child: cart.length == 0
                  ? Center(
                      child: Text(
                      'Your cart is empty :(',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.black26),
                    ))
                  : AnimatedList(
                      key: key,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      initialItemCount: cart.length,
                      itemBuilder: (context, index, animation) {
                        return BuildItem(cart[index], index, animation);
                      }),
            )
          ],
        ),
      ),
    );
  }

  Widget BuildItem(item, int index, Animation<double> animation) {
    return CartItemWidget(
        item: item, animation: animation, onClicked: () => removeItem(index));
  }

  void removeItem(int index) {
    subtractItemPrice(index);
    final item = cart.removeAt(index);

    key.currentState!.removeItem(
        index, (context, animation) => BuildItem(item, index, animation));
  }

  @override
  void initState() {
    if (cart.isNotEmpty) {
      for (var item in cart) {
        setState(() {
          print(item['product'].price);
          totalAmount = totalAmount + item['product'].price;
        });
      }
    } else
      setState(() {
        totalAmount = 0;
      });
  }

  void subtractItemPrice(i) {
    setState(() {
      totalAmount = totalAmount - cart[i]['product'].price;
    });
  }
}

/*
TextField(
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      hintText: 'SEARCH',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0.0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0.0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
 */
