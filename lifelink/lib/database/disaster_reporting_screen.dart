import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisasterReportingScreen extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();

  DisasterReportingScreen({super.key});
  // Assuming you'll handle image uploads and geolocation with other methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Disaster'),
      ),
      body: Column(
        children: [
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          // Implement image picker and geolocation here
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('disasters').add({
                'description': descriptionController.text,
                'timestamp': FieldValue.serverTimestamp(),
                // Add image URL and location here
              });
              descriptionController.clear();
            },
            child: const Text('Report'),
          ),
        ],
      ),
    );
  }
}
