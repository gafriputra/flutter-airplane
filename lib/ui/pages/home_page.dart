import 'package:flutter/material.dart';
import 'package:fluuter_airplane/shared/theme.dart';
import 'package:fluuter_airplane/ui/widgets/destination_card.dart';
import 'package:fluuter_airplane/ui/widgets/destination_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = ['Waru', 'Sedati', 'Buduran', 'Siwalan', 'Semolowaru'];

    Widget header() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy,\nGafri Putra',
                    style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Where to fly today',
                    style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image_profile.png')), shape: BoxShape.circle),
            )
          ],
        ),
      );
    }

    Widget popularDestionation() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (var item in items)
              DestinationCard(
                name: item,
                imageUrl: 'assets/image_destination${items.indexOf(item) + 1}.png',
                city: 'Sidoarjo',
              ),
            SizedBox(),
          ]),
        ),
      );
    }

    Widget newDestination() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            for (var item in items)
              DestinationTile(
                name: item,
                imageUrl: 'assets/image_destination${items.indexOf(item) + 5}.png',
                city: 'Sidoarjo',
              ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularDestionation(),
        newDestination(),
      ],
    );
  }
}
