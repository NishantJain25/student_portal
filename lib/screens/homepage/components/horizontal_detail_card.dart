import 'dart:ui';
import 'package:image_pixels/image_pixels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_portal/screens/constants/fonts.dart';
import 'package:student_portal/screens/homepage/components/view_details.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:student_portal/models/accommodations.dart';
import 'package:student_portal/widgets/ratingContainer.dart';

class DetailCard extends StatefulWidget {
  DetailCard(this.accommodationInfo);
  final accommodationInfo;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  PaletteColor? color;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  _updatePalette() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
        NetworkImage(widget.accommodationInfo.imageUrl),
        size: Size(200, 200),
        maximumColorCount: 5);

    setState(() {
      color = generator.lightMutedColor ?? PaletteColor(Colors.black12, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140.0,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color.fromRGBO(240, 240, 240, 1),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ViewDetails(widget.accommodationInfo)));
          },
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                  tag: 'Hostel-${widget.accommodationInfo.name}',
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        widget.accommodationInfo.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.accommodationInfo.name,
                            style: cardTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        RatingContainer(widget.accommodationInfo.rating),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: subtitleColor,
                        ),
                        Flexible(
                          child: Text(
                            widget.accommodationInfo.location,
                            style: cardSubtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${NumberFormat.simpleCurrency(locale: 'en_US', name: 'INR').currencySymbol} ${widget.accommodationInfo.costing['rent']}',
                          style: price,
                        ),
                        Text(
                          '/ ${widget.accommodationInfo.costing['duration'] == 'monthly' ? 'month' : widget.accommodationInfo.costing['duration'] == 'yearly' ? 'year' : '3 months'}',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
