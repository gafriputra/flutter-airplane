import 'package:flutter/material.dart';
import 'package:fluuter_airplane/cubit/seat_cubit.dart';
import 'package:fluuter_airplane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;
  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        }
        return kAvailableColor;
      }
    }

    borderColor() {
      return !isAvailable ? kUnavailableColor : kPrimaryColor;
    }

    child() {
      return isSelected
          ? Center(
              child: Text(
                'You',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            )
          : SizedBox();
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: backgroundColor(), borderRadius: BorderRadius.circular(15), border: Border.all(color: borderColor(), width: 2)),
          child: child()),
    );
  }
}
