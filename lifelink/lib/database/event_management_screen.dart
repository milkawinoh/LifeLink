import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventManagementScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  EventManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Events'),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Event Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Event Description'),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('events').add({
                'title': titleController.text,
                'description': descriptionController.text,
                'timestamp': FieldValue.serverTimestamp(),
              });
              titleController.clear();
              descriptionController.clear();
            },
            child: const Text('Create Event'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('events')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var events = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    var event = events[index];
                    return ListTile(
                      title: Text(event['title']),
                      subtitle: Text(event['description']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EventDetailsScreen(eventId: event.id),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EventDetailsScreen extends StatelessWidget {
  final String eventId;
  const EventDetailsScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('events')
            .doc(eventId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var event = snapshot.data!;
          return Column(
            children: [
              Text('Title: ${event['title']}'),
              Text('Description: ${event['description']}'),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('events')
                      .doc(eventId)
                      .collection('attendees')
                      .add({
                    'userId': FirebaseAuth.instance.currentUser!.uid,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                },
                child: const Text('RSVP'),
              ),
            ],
          );
        },
      ),
    );
  }
}
