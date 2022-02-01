import 'package:flutter/material.dart';
import 'package:student_portal/models/products.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:student_portal/screens/homepage/components/view_details.dart';
import 'package:student_portal/screens/store/components/cart.dart';
import 'package:student_portal/screens/store/components/view_product_details.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(this.productInfo);
  final Products productInfo;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  PaletteColor? color;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  _updatePalette() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
        NetworkImage(widget.productInfo.imageUrl),
        size: Size(200, 200),
        maximumColorCount: 5);
    if (generator != null) {
      setState(() {
        color =
            generator.lightMutedColor ?? PaletteColor(Colors.transparent, 3);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 100,
      decoration: BoxDecoration(
          color: color?.color, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ViewProductDetails(widget.productInfo, color)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Hero(
                  tag: 'Hostel-${widget.productInfo.name}',
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.transparent),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        widget.productInfo.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.productInfo.category.toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        )))
              ]),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    widget.productInfo.name,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Rs. ${widget.productInfo.price}',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                        fontSize: 16),
                  ),
                ),
              ]),
              SizedBox(height: 10),
              Text(
                'Seller: ${widget.productInfo.sellerName}',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
