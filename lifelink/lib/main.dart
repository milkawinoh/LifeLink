import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifelink/database/event_management_screen.dart';
import 'package:lifelink/database/forum_screen.dart';
import 'package:lifelink/database/project_list_screen.dart';
import 'package:lifelink/database/volunteer_management_screen.dart';
import 'package:lifelink/firebase_auth/auth_service.dart';
import 'package:lifelink/firebase_auth/auth_wrapper.dart';
import 'package:lifelink/firebase_auth/login_screen.dart';
import 'package:lifelink/firebase_auth/role_selection_screen.dart';
import 'package:lifelink/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        title: 'LifeLink',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper(),
        routes: {
          '/sign-in': (context) => SignInScreen(),
          '/role-selection': (context) => const RoleSelectionScreen(),
          '/home': (context) => const HomeScreen(),
          '/project-list': (context) => const ProjectListScreen(),
          '/volunteer-management': (context) =>
              const VolunteerManagementScreen(),
          '/forum': (context) => ForumScreen(),
          '/event-management': (context) => EventManagementScreen(),
        },
      ),
    );
  }
}
