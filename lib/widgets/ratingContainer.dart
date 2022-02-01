import 'package:flutter/material.dart';

Widget RatingContainer(int rating) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.star_rounded,
            color: Colors.amberAccent,
            size: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Text('$rating',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
        ],
      ),
    ),
  );
}
