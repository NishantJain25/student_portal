import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';

import 'package:intl/intl.dart';
import 'package:student_portal/widgets/detail_header.dart';
import 'package:student_portal/models/products.dart';
import 'package:student_portal/screens/chat/chatbox.dart';
import 'package:student_portal/screens/store/components/cart.dart';

class ViewProductDetails extends StatefulWidget {
  const ViewProductDetails(this.productDetails, this.paletteColor);
  final productDetails;
  final paletteColor;
  @override
  State<ViewProductDetails> createState() => _ViewProductDetailsState();
}

class _ViewProductDetailsState extends State<ViewProductDetails> {
  final List<String> imageList = [
    'https://images.unsplash.com/photo-1520277739336-7bf67edfa768?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1623625434462-e5e42318ae49?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: widget.paletteColor.color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                      fontSize: 16),
                ),
                Text(
                  '${NumberFormat.simpleCurrency(locale: 'en_US', name: 'INR').currencySymbol} ${widget.productDetails.price}',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width / 2 - 25, 50))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Chatbox(
                              username: widget.productDetails.sellerName)));
                },
                child: Text(
                  'CONTACT OWNER',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width / 2 - 25, 50))),
                onPressed: () {
                  cart.insert(0, {
                    'product': widget.productDetails,
                    'paletteColor': widget.paletteColor
                  });
                  final snackBar = SnackBar(
                    content: Text('${widget.productDetails.name} added to cart',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 14)),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.black,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ]),
          ],
        ),
      ),
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 52,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            backgroundColor: Colors.white30,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.white30,
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage())),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: DetailHeader(
              minExtent: 100.0,
              maxExtent: 500,
              url: widget.productDetails.imageUrl,
              name: widget.productDetails.name,
              imageList: imageList,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productDetails.name,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 24),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.productDetails.category.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(widget.productDetails.description,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              letterSpacing: -0.25)),
                      SizedBox(height: 30),
                      Text('Seller Name',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          )),
                      SizedBox(height: 5),
                      Text(widget.productDetails.sellerName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              letterSpacing: -0.25)),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
