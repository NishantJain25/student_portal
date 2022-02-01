import 'package:flutter/material.dart';
import 'package:student_portal/widgets/view_images.dart';
import 'package:flutter/rendering.dart';

class DetailHeader implements SliverPersistentHeaderDelegate {
  DetailHeader({
    required this.minExtent,
    required this.maxExtent,
    required this.url,
    required this.name,
    required this.imageList,
  });
  final double minExtent;
  final double maxExtent;
  final String url;
  final String name;
  final List<String> imageList;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ImageViewer(imageList)));
      },
      child: Stack(children: [
        Hero(
          transitionOnUserGestures: true,
          tag: 'Hostel-$name',
          child: ClipRRect(
            child: Image.network(
              url,
              height: 500,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white60, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                '${imageList.length - 1}+',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;
}
