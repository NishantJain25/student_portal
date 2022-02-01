import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/widgets/build_header.dart';
import 'package:student_portal/screens/store/components/category.dart';
import 'package:student_portal/screens/store/components/product_card.dart';
import 'package:student_portal/models/products.dart';

class StoreBody extends StatefulWidget {
  const StoreBody({Key? key}) : super(key: key);

  @override
  _StoreBodyState createState() => _StoreBodyState();
}

class _StoreBodyState extends State<StoreBody> {
  final List categories = ['Books', 'Stationary', 'Furniture', 'Other'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildHeader('Buy & Sell With Ease'),
            Text(
              'Categories',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 15),
            Container(
              height: 150,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: OpenContainer(
                          transitionDuration: Duration(milliseconds: 500),
                          transitionType: ContainerTransitionType.fadeThrough,
                          closedColor: Colors.black,
                          closedElevation: 0,
                          openElevation: 0,
                          closedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          openShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          closedBuilder: (context, openContainer) => Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: getImage(categories[index]),
                                      fit: BoxFit.cover),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      categories[index],
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    )),
                              )),
                          openBuilder: (context, _) =>
                              CategoryPage(category: categories[index])),
                    );
                  }),
            ),
            SizedBox(height: 30),
            Text(
              'Products For Sale',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: products.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ProductCard(products[index]);
                    }))
          ],
        ),
      ),
    );
  }

  getImage(category) {
    switch (category) {
      case 'Books':
        {
          return NetworkImage(
            'https://media.istockphoto.com/vectors/glossary-book-concept-modern-vocabulary-and-dictionary-idea-studying-vector-id1329709512?k=20&m=1329709512&s=612x612&w=0&h=lDu4Ol_DhOyrqU1HHQcenYwvLQWEAthC0A_4uBVRG6c=',
          );
          ;
        }
        break;
      case 'Stationary':
        {
          return NetworkImage(
            'https://media.istockphoto.com/vectors/businessman-signing-digital-contract-document-electronic-signature-on-vector-id1271958774?k=20&m=1271958774&s=612x612&w=0&h=uEMUozVA69Qp0SQ3-tevxiWx_pvyZpZGhwER3-2Kvtk=',
          );
        }
        break;
      case 'Furniture':
        {
          return NetworkImage(
            'https://media.istockphoto.com/vectors/get-new-opportunity-get-job-done-get-approval-vector-id1290807953?k=20&m=1290807953&s=612x612&w=0&h=Zdlad-JY4wX0iamNlggg50pdxytT9fXZ4Asa27_TZr0=',
          );
          ;
        }
        break;
      case 'Other':
        {
          return NetworkImage(
            'https://media.istockphoto.com/vectors/young-lady-sitting-on-shopping-bag-and-doing-online-mobile-shopping-vector-id1214538506?k=20&m=1214538506&s=612x612&w=0&h=TQjSCCoeFSTdglnCgojYydR3ZAUcJqqLe4BSzmWcmEQ=',
          );
        }
        break;
    }
  }
}
