import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:student_portal/models/accommodations.dart';
import 'package:student_portal/screens/map.dart';
import 'package:student_portal/screens/map_fullscreen.dart';
import 'package:student_portal/widgets/ratingContainer.dart';
import '../../../widgets/detail_header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails(this.details);
  final details;

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  final List<String> imageList = [
    'https://images.unsplash.com/photo-1520277739336-7bf67edfa768?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1623625434462-e5e42318ae49?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG9zdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kIndia =
      CameraPosition(target: LatLng(19.076090, 72.877426), zoom: 15);
  var favourite = false;

  @override
  Widget build(BuildContext context) {
    final rent = widget.details.costing['rent'];
    final duration = widget.details.costing['duration'];
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leadingWidth: 52,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            backgroundColor: Colors.white54,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Costing',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                      fontSize: 16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${NumberFormat.simpleCurrency(locale: 'en_US', name: 'INR').currencySymbol} ${rent} ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    Text(
                      '/ ${duration == 'monthly' ? 'month' : duration == 'yearly' ? 'year' : '3 months'}',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 50))),
              onPressed: () {},
              child: Text(
                'CONTACT OWNER',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: DetailHeader(
              minExtent: 0,
              maxExtent: 500,
              url: widget.details.imageUrl,
              name: widget.details.name,
              imageList: imageList,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                //BuildDetails(widget.details.toMap(), widget.details),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.details.name,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              favourites.contains(widget.details)
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: favourites.contains(widget.details)
                                  ? Colors.redAccent
                                  : null,
                            ),
                            onPressed: () {
                              var snackBar = favourites.contains(widget.details)
                                  ? SnackBar(
                                      content: Text(
                                          '${widget.details.name} has been removed from favourites',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14)),
                                      duration: Duration(seconds: 1),
                                      backgroundColor: Colors.black,
                                    )
                                  : SnackBar(
                                      behavior: SnackBarBehavior.fixed,
                                      content: Text(
                                          '${widget.details.name} has been added to favourites',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14)),
                                      duration: Duration(seconds: 1),
                                      backgroundColor: Colors.black,
                                    );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(() {
                                favourites.contains(widget.details)
                                    ? favourites.remove(widget.details)
                                    : favourites.add(widget.details);
                              });
                            },
                          ),
                          SizedBox(width: 20),
                          RatingContainer(widget.details.rating)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    widget.details.description,
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Address',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    widget.details.location,
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                  ),
                ),
                SizedBox(height: 30),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(clipBehavior: Clip.none, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: OpenMap(fullscreen: false)),
                    Positioned(
                        right: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FullscreenMap())),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0),
                            ),
                          ),
                        ))
                  ]),
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Amenities',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (var item in widget.details.amenities)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 14),
                              ),
                            ),
                          ),
                      ]),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

/*  Widget BuildDetails(details, product) {
    List<Widget> widgetList = [];
    List<Widget> nameRow = [];
    for (var entry in details.entries) {
      if (entry.key == 'name' || entry.key == 'price') {
        nameRow.add(Text(
          entry.key == 'price' ? 'Rs. ${entry.value}' : '${entry.value}',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ));
      } else {
        if (entry.key == 'rating') {
          nameRow.add(;
        } else {
          if (entry.key == 'amenities') {
            widgetList.add(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key.toString().toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.black26,
                  ),
                ),
                SizedBox(height: 5),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 5,
                  runSpacing: 10,
                  children: [
                    for (var item in entry.value)
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            item,
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 14),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ));
          } else {
            widgetList.add(
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                entry.key == 'sellerName'
                    ? 'SELLER NAME'
                    : entry.key.toString().toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black26,
                ),
              ),
              SizedBox(height: 5),
              Text('${entry.value}',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: -0.25)),
              SizedBox(height: 30),
              if (entry.key == 'category')
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cart.insert(0, {
                          'product': product,
                          'paletteColor': widget.paletteColor
                        });
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 50))),
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                )
              else
                SizedBox(height: 0),
            ]));
          }
        }
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: nameRow),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
                minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 50))),
            onPressed: () {},
            child: Text(
              'CONTACT OWNER',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 16, color: Colors.white),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

*/
}
