import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:googlelogin/src/services/authentication_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    AuthenticationService authenticationService = AuthenticationService();
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
                    "Register to your account",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
                    child: Text('REGISTER'),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 100,
                      color: Colors.white,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 100,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
                      () => Stack(
                    alignment: Alignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: isLoading.value
                            ? null
                            : () async {
                          try {
                            isLoading.value = true;
                            await authenticationService.handleGoogleSignIn();
                            Get.offNamed('/dashboard');
                          } catch (error) {
                            print('Error during Google Sign-In: $error');
                          } finally {
                            isLoading.value = false;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        icon: Icon(Icons.g_mobiledata_rounded),
                        label: Text('Sign in with Google'),
                      ),
                      Visibility(
                        visible: isLoading.value,
                        child: SpinKitCircle(
                          color: Colors.white,
                          size: 36.0,
                        ),
                      ),
                    ],
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
