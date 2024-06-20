import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerManagementScreen extends StatelessWidget {
  const VolunteerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Volunteers'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('projects').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var projects = snapshot.data!.docs;
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              var project = projects[index];
              return ListTile(
                title: Text(project['title']),
                subtitle: Text('Volunteers: ${project['volunteers'].length}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolunteerListScreen(project.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class VolunteerListScreen extends StatelessWidget {
  final String projectId;

  const VolunteerListScreen(this.projectId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('projects')
            .doc(projectId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var project = snapshot.data!;
          var volunteers = project['volunteers'];
          return ListView.builder(
            itemCount: volunteers.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(volunteers[index]['name']),
                subtitle: Text(volunteers[index]['email']),
              );
            },
          );
        },
      ),
    );
  }
}
