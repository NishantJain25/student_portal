import 'package:flutter/material.dart';
import 'package:student_portal/widgets/build_header.dart';
import 'product_card.dart';
import 'package:student_portal/models/products.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              category,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 48.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '( ${getCategoryProducts().length} ${getCategoryProducts().length == 1 ? 'Product' : 'Products'} Found )',
              maxLines: 2,
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: getCategoryProducts().length,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ProductCard(getCategoryProducts()[index])),
            ),
          ]),
        ),
      ),
    );
  }

  getCategoryProducts() {
    List filteredProducts = [];
    for (var item in products) {
      if (item.category == category) filteredProducts.add(item);
    }
    return filteredProducts;
  }
}
