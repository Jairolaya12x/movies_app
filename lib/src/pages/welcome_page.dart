import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(),
        Scaffold(
          body: _content(),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }

  Widget _background() {
    final _sigmaY = 1.5;
    final _sigmaX = 1.5;
    final _opacity = 0.1;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome_wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
        child: Container(
          color: Colors.black.withOpacity(_opacity),
        ),
      ),
    );
  }

  Widget _content() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/movie-ticket.png',
              color: Colors.white,
              height: 65,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Movie App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            _formLogin(),
          ],
        ),
      ),
    );
  }

  Widget _formLogin() {
    return Column(
      children: [
        _inputField('Username'),
        _inputField('Password', obscureText: true),
        FlatButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          onPressed: () {},
          child: Text('Ingresar'),
        ),
      ],
    );
  }

  Widget _inputField(String title, {bool obscureText = false}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.white60,
              spreadRadius: 2.5,
              blurRadius: 3.5,
            )
          ]),
      child: TextField(
        cursorColor: Colors.black,
        obscureText: obscureText,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          fillColor: Colors.white,
          hintText: title,
        ),
      ),
    );
  }
}
