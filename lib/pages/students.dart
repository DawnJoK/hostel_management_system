import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';

class StudentsPage extends StatelessWidget {
  final bool isWarden;
  const StudentsPage({super.key, required this.isWarden});

  @override
  Widget build(BuildContext context) {
    final studentsRef = FirebaseFirestore.instance
        .collection('artifacts')
        .doc(appId)
        .collection('public')
        .doc('data')
        .collection('students');

    return StreamBuilder<QuerySnapshot>(
      stream: studentsRef.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        final docs = snapshot.data!.docs;

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: docs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
            return ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade100)
              ),
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(data['name'] ?? 'Student Name'),
              subtitle: Text(data['dept'] ?? 'Department'),
              trailing: Text("Room ${data['room'] ?? 'N/A'}", 
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
            );
          },
        );
      },
    );
  }
}