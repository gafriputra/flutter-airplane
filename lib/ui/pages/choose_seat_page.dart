import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluuter_airplane/cubit/seat_cubit.dart';
import 'package:fluuter_airplane/models/destination_model.dart';
import 'package:fluuter_airplane/shared/theme.dart';
import 'package:fluuter_airplane/ui/pages/checkout_page.dart';
import 'package:fluuter_airplane/ui/widgets/custom_bottom.dart';
import 'package:fluuter_airplane/ui/widgets/seat_item.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Select Yout\nFavorite Seat',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                right: 6,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_available.png'),
                ),
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_selected.png'),
                ),
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_unavailable.png'),
                ),
              ),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return CustomBottom(
        title: 'Continue to Checkout',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutPage(),
            ),
          );
        },
        margin: EdgeInsets.only(
          top: 30,
          bottom: 46,
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  18,
                ),
                color: kWhiteColor),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ["A", "B", "", "C", "D"]
                        .map((e) => Container(
                              width: 48,
                              height: 84,
                              child: Center(
                                child: Text(
                                  e,
                                  style: greenTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ))
                        .toList()),

                for (var i = 1; i < 11; i++)
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SeatItem(
                          id: "A${i.toString()}",
                        ),
                        SeatItem(
                          id: "B${i.toString()}",
                          isAvailable: false,
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          child: Center(
                            child: Text(
                              i.toString(),
                              style: greenTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SeatItem(
                          id: "C${i.toString()}",
                        ),
                        SeatItem(
                          id: "D${i.toString()}",
                        ),
                      ],
                    ),
                  ),

                // Your Seat
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat',
                        style: greenTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          state.isEmpty ? '' : state.join(', '),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                // Your Seat
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greenTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(
                          destination.price * state.length,
                        ),
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(),
        ],
      ),
    );
  }
}
