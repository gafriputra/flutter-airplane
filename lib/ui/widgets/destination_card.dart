import 'package:flutter/material.dart';
import 'package:fluuter_airplane/models/destination_model.dart';
import 'package:fluuter_airplane/shared/theme.dart';
import 'package:fluuter_airplane/ui/pages/detail_page.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel destination;

  const DestinationCard({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              destination: destination,
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(left: defaultMargin),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(destination.imageUrl),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 55,
                  decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        margin: EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/icon_star.png'))),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
                    style: greenTextStyle.copyWith(fontWeight: light),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
