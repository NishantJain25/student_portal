import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 48,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      TextField(
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          hintText: 'Search',
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          fillColor: Colors.black12,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(15.0)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(15.0)),
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
    ]);
  }
}
