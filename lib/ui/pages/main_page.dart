import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluuter_airplane/cubit/page_cubit.dart';
import 'package:fluuter_airplane/shared/theme.dart';
import 'package:fluuter_airplane/ui/pages/home_page.dart';
import 'package:fluuter_airplane/ui/pages/setting_page.dart';
import 'package:fluuter_airplane/ui/pages/transaction_page.dart';
import 'package:fluuter_airplane/ui/pages/wallet_page.dart';
import 'package:fluuter_airplane/ui/widgets/custom_bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 30, left: defaultMargin, right: defaultMargin),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(defaultRadius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_home.png',
                index: 0,
              ),
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_booking.png',
                index: 1,
              ),
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_card.png',
                index: 2,
              ),
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_settings.png',
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(builder: (
      context,
      currentIndex,
    ) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(children: [
          buildContent(currentIndex),
          customButtonNavigation(),
        ]),
      );
    });
  }
}
