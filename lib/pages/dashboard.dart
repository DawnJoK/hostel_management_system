import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final bool isWarden;
  const DashboardPage({super.key, required this.isWarden});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _card("Rooms", "45", Icons.meeting_room, Colors.blue),
              _card("Students", "128", Icons.people, Colors.indigo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(String t, String v, IconData i, Color c) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(i, color: c, size: 30),
          Text(v, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(t, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}