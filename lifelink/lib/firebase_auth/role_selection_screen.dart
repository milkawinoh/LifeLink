import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthService>().user;

    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Role'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .set({'role': 'NGO'}, SetOptions(merge: true));
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text('NGO'),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .set({'role': 'Volunteer'}, SetOptions(merge: true));
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text('Volunteer'),
          ),
        ],
      ),
    );
  }
}
