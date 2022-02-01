import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer(this.imageList);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Image.network(imageList[index],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth);
                })),
      ),
    );
  }
}
