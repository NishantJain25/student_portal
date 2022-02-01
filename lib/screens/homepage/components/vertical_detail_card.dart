import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_portal/screens/homepage/components/view_details.dart';
import 'package:student_portal/widgets/ratingContainer.dart';
import 'package:student_portal/models/accommodations.dart';
import '../../constants/fonts.dart';

class VerticalDetailCard extends StatefulWidget {
  Accommodations accommodationInfo;

  VerticalDetailCard({required this.accommodationInfo});

  @override
  _VerticalDetailCardState createState() => _VerticalDetailCardState();
}

class _VerticalDetailCardState extends State<VerticalDetailCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewDetails(widget.accommodationInfo))),
      child: Hero(
        tag: 'Hostel-${widget.accommodationInfo.name}',
        child: Container(
          padding: EdgeInsets.all(10),
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey,
              image: DecorationImage(
                  image: NetworkImage(widget.accommodationInfo.imageUrl),
                  fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.accommodationInfo.name,
                          style: cardTitle,
                          maxLines: 1,
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
                        color: Color.fromRGBO(175, 175, 175, 1),
                      ),
                      Flexible(
                        child: Text(
                          widget.accommodationInfo.location,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(175, 175, 175, 1)),
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
            ),
          ),
        ),
      ),
    );
  }
}
