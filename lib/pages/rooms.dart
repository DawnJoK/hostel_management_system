import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';

class RoomsPage extends StatelessWidget {
  final bool isWarden;
  const RoomsPage({super.key, required this.isWarden});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance
        .collection('artifacts')
        .doc(appId)
        .collection('public')
        .doc('data')
        .collection('rooms');

    return Scaffold(
      floatingActionButton: isWarden ? FloatingActionButton(
        onPressed: () {}, // Add logic here
        child: const Icon(Icons.add),
      ) : null,
      body: StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              return ListTile(
                title: Text("Room ${data['number']}"),
                subtitle: Text(data['type'] ?? 'Standard'),
              );
            },
          );
        },
      ),
    );
  }
}