import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF55C6A9),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Login to your account",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Lottie.asset(
                  'assets/lottie/login.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                  initialCountryCode: 'NP',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                    print(phone.countryCode);
                    print(phone.number);
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text('LOGIN'),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/register');
                  },
                  child: Text(
                    "Don't have an account? Create an account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}