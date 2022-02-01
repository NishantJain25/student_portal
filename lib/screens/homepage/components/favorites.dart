import 'package:flutter/material.dart';
import 'package:student_portal/models/accommodations.dart';
import 'package:student_portal/screens/homepage/components/horizontal_detail_card.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

//use a separate favourites list and animated list to update the list.
class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: true,
        leadingWidth: 64,
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favourites',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '( ${favourites.length} ${favourites.length == 1 ? 'Product' : 'Products'} Found )',
              maxLines: 2,
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            favourites.isNotEmpty
                ? ListView.builder(
                    itemCount: favourites.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (context, index) {
                      return DetailCard(favourites[index]);
                    },
                  )
                : Center(
                    child: Text(
                    'No favourites selected :(',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.black26),
                  ))
          ],
        ),
      ),
    );
  }
}
