import 'package:flutter/material.dart';
import 'package:fluuter_airplane/models/destination_model.dart';
import 'package:fluuter_airplane/shared/theme.dart';
import 'package:fluuter_airplane/ui/pages/choose_seat_page.dart';
import 'package:fluuter_airplane/ui/widgets/custom_bottom.dart';
import 'package:fluuter_airplane/ui/widgets/interest_item.dart';
import 'package:fluuter_airplane/ui/widgets/photo_item.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;
  const DetailPage({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        height: 214,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 236,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              kBlackColor.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            // emblem
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(
                top: 60,
                left: defaultMargin,
                right: defaultMargin,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_emblem.png'),
                ),
              ),
            ),
            // title
            Container(
              margin: EdgeInsets.only(
                top: 256,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destination.city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
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
                        destination.rating.toString(),
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(
                  18,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // about
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Ini adalah deskripnya, tapi ngawur Ini adalah deskripnya, tapi ngawurIni adalah deskripnya, tapi ngawur',
                    style: blackTextStyle.copyWith(height: 2),
                  ),

                  // photos
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PhotoItem(
                          imageUrl: 'assets/image_photo1.png',
                        ),
                        PhotoItem(
                          imageUrl: 'assets/image_photo2.png',
                        ),
                        PhotoItem(
                          imageUrl: 'assets/image_photo3.png',
                        ),
                        PhotoItem(
                          imageUrl: 'assets/image_photo3.png',
                        ),
                        PhotoItem(
                          imageUrl: 'assets/image_photo3.png',
                        ),
                      ],
                    ),
                  ),
                  // Interest
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Interest',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  Row(
                    children: [
                      InterestItem(
                        text: 'Ramah Lingkungan',
                      ),
                      InterestItem(
                        text: 'Ramah Lingkungan',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InterestItem(
                        text: 'Ramah Lingkungan',
                      ),
                      InterestItem(
                        text: 'Ramah Lingkungan',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Price and book bottom
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: Row(
                children: [
                  // Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(
                            destination.price,
                          ),
                          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per orang',
                          style: greenTextStyle.copyWith(fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  // Bottom
                  CustomBottom(
                    title: 'Book Now',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseSeatPage(
                            destination: destination,
                          ),
                        ),
                      );
                    },
                    width: 170,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
