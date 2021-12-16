import 'package:flutter/material.dart';
import 'package:fluuter_airplane/shared/theme.dart';

class SeatItem extends StatelessWidget {
  // 0 = available, 1 = selected, 2 = unavailabe;
  final int status;
  const SeatItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (status) {
        case 0:
          return kAvailableColor;
        case 1:
          return kPrimaryColor;
        default:
          return kUnavailableColor;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return kPrimaryColor;
        case 1:
          return kPrimaryColor;
        default:
          return kUnavailableColor;
      }
    }

    child() {
      switch (status) {
        case 1:
          return Center(
            child: Text(
              'You',
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );
        default:
          return SizedBox();
      }
    }

    return Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: backgroundColor(), borderRadius: BorderRadius.circular(15), border: Border.all(color: borderColor(), width: 2)),
        child: child());
  }
}
