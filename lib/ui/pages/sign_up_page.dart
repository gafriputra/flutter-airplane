import 'package:flutter/material.dart';
import 'package:fluuter_airplane/shared/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                    hintText: 'Your Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: kPrimaryColor))),
              )
            ],
          ),
        );
      }

      Widget emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: true,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                    hintText: 'Your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: kPrimaryColor))),
              )
            ],
          ),
        );
      }

      Widget passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                    hintText: 'Your Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: kPrimaryColor))),
              )
            ],
          ),
        );
      }

      Widget hobbyInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hobby',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                    hintText: 'Your Hobby',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: kPrimaryColor))),
              )
            ],
          ),
        );
      }

      Widget submitButton() {
        return Container(
          height: 50,
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Get Started',
              style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
            style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultRadius))),
          ),
        );
      }

      Widget tacButton() {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50, bottom: 73),
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
