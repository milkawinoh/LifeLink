import 'package:flutter/material.dart';
import 'package:lifelink/database/event_management_screen.dart';
import 'package:lifelink/database/forum_screen.dart';
import 'package:lifelink/database/project_list_screen.dart';
import 'package:lifelink/database/volunteer_management_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProjectListScreen()),
                );
              },
              child: const Text('Project Listings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VolunteerManagementScreen()),
                );
              },
              child: const Text('Manage Volunteers'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForumScreen()),
                );
              },
              child: const Text('Community Forums'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EventManagementScreen()),
                );
              },
              child: const Text('Event Management'),
            ),
          ],
        ),
      ),
    );
  }
}
