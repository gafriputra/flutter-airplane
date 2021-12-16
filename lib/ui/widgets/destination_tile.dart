import 'package:flutter/material.dart';
import 'package:fluuter_airplane/shared/theme.dart';

class DestinationTile extends StatelessWidget {
  final String name, city, imageUrl;
  final double rating;
  const DestinationTile({Key? key, required this.name, required this.city, required this.imageUrl, this.rating = 4.5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  city,
                  style: greenTextStyle.copyWith(fontWeight: light),
                ),
              ],
            ),
          ),
          Row(
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
                rating.toString(),
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
            ],
          ),
        ],
      ),
    );
  }
}