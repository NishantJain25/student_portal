import 'package:flutter/material.dart';
import 'package:student_portal/screens/homepage/components/view_details.dart';
import 'package:student_portal/models/products.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:student_portal/screens/store/components/view_product_details.dart';

class CartItemWidget extends StatelessWidget {
  final Map item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  CartItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: ImagePixels(
          imageProvider: NetworkImage(item['product'].imageUrl),
          builder: (BuildContext context, ImgDetails img) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewProductDetails(
                          item['product'], item['paletteColor']))),
              child: Container(
                margin: EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: item['paletteColor'].color.withOpacity(0.75)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              item['product'].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['product'].name.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item['product'].category.toUpperCase(),
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8),
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rs. ${item['product'].price}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: onClicked,
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          size: 30,
                        ),
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
