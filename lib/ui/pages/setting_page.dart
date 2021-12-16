import 'package:flutter/material.dart';
import 'package:fluuter_airplane/cubit/auth_cubit.dart';
import 'package:fluuter_airplane/shared/theme.dart';
import 'package:fluuter_airplane/ui/widgets/custom_bottom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: kRedColor,
          ));
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: CustomBottom(
              title: 'Sign Out',
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              width: 220,
            ),
          );
        }
      },
    );
  }
}
