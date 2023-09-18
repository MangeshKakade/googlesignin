import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController dashboardController = Get.put(DashboardController());
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF55C6A9),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user?.photoURL ?? ''),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome,',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                user?.displayName ?? 'Guest',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                user?.email ?? 'N/A',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  dashboardController.signOut();
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
