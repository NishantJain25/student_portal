import 'package:flutter/material.dart';
import 'package:student_portal/screens/homepage/components/vertical_detail_card.dart';
import 'package:student_portal/widgets/build_header.dart';
import 'package:student_portal/screens/homepage/components/horizontal_detail_card.dart';
import 'package:student_portal/models/accommodations.dart';

class HomeBody extends StatelessWidget {
  const HomeBody(this.accommodations);
  final List<Accommodations> accommodations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BuildHeader('Find A Place That Suits Your Needs'),
            Text(
              'Popular',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 15),
            Container(
              height: 300,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: accommodations.length,
                  itemBuilder: (context, i) {
                    return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: VerticalDetailCard(
                          accommodationInfo: accommodations[i],
                        ));
                  }),
            ),
            SizedBox(height: 30),
            Text(
              'Near Your College',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: accommodations.length,
                  itemBuilder: (BuildContext context, int i) {
                    return DetailCard(accommodations[i]);
                  }),
            ),
            /*  Column(mainAxisSize: MainAxisSize.min, children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.black,
                indicatorWeight: 3.0,
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
                tabs: [
                  Tab(
                    text: 'Near the College',
                  ),
                  Tab(
                    text: 'Popular',
                  ),
                  Tab(
                    text: 'Favourites',
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: TabBarView(physics: ScrollPhysics(), children: [
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: accommodations.length,
                      itemBuilder: (BuildContext context, int i) {
                        return DetailCard(accommodations[i]);
                      }),
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: accommodations.length,
                      itemBuilder: (BuildContext context, int i) {
                        return DetailCard(accommodations[i]);
                      }),
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: accommodations.length,
                      itemBuilder: (BuildContext context, int i) {
                        return DetailCard(accommodations[i]);
                      }),
                ]),
              ),
            ])*/
          ]),
        ),
      ),
    );
  }
}
