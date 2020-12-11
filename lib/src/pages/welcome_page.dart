import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/src/providers/data_preferences.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key key}) : super(key: key);

  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(),
        Scaffold(
          body: _content(context),
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

  Widget _content(BuildContext context) {
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
            _formLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _formLogin(BuildContext context) {
    return Column(
      children: [
        _inputField('Username', controller: _usernameController),
        _inputField('Password', obscureText: true),
        FlatButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          onPressed: () {
            DataPreferences().currentUserName = _usernameController.value.text;
            Navigator.pushNamed(context, 'home');
          },
          child: Text('Ingresar'),
        ),
      ],
    );
  }

  Widget _inputField(String title, {bool obscureText = false, TextEditingController controller}) {
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
        controller: controller,
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
