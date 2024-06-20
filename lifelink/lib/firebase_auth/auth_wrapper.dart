import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lifelink/home_screen.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'login_screen.dart';
import 'role_selection_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthService>().user;

    if (user == null) {
      return SignInScreen();
    }

    // You can fetch the user's role from Firestore here and navigate accordingly.
    return FutureBuilder(
      future: fetchUserRole(user.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }
        if (snapshot.data == 'NGO') {
          return const HomeScreen();
        } else if (snapshot.data == 'Volunteer') {
          return const HomeScreen(); // Change to Volunteer Home Screen if different
        } else {
          return const RoleSelectionScreen();
        }
      },
    );
  }

  Future<String?> fetchUserRole(String uid) async {
    try {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc.data()?['role'];
      }
    } catch (e) {
      print('Error fetching user role: $e');
    }
    return null;
  }
}
