import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluuter_airplane/cubit/auth_cubit.dart';
import 'package:fluuter_airplane/shared/theme.dart';
import 'package:fluuter_airplane/ui/widgets/custom_bottom.dart';
import 'package:fluuter_airplane/ui/widgets/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFormField(
          title: 'Full Name',
          hintText: 'Your Full Name',
          controller: nameController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Address',
          hintText: 'Your Email Address',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Your Password',
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget hobbyInput() {
        return CustomTextFormField(
          title: 'Hobby',
          hintText: 'Your Hobby',
          controller: hobbyController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/bonus',
                (route) => false,
              );
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: kRedColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CustomBottom(
                title: 'Get Started',
                width: 220,
                onPressed: () {
                  context.read<AuthCubit>().signUp(
                        email: emailController.text,
                        name: nameController.text,
                        password: passwordController.text,
                        hobby: hobbyController.text,
                      );
                },
              );
            }
          },
        );
      }

      Widget tacButton() {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
            bottom: 30,
          ),
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light, decoration: TextDecoration.underline),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [nameInput(), emailInput(), passwordInput(), hobbyInput(), submitButton(), tacButton()],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [title(), inputSection()],
        ),
      ),
    );
  }
}
