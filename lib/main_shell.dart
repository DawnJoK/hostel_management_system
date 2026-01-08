import 'package:flutter/material.dart';
import 'pages/dashboard.dart';
import 'pages/rooms.dart';
import 'pages/students.dart';
import 'pages/fees.dart';
import 'pages/attendance.dart';
import 'pages/complaints.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  bool _isWarden = true;

  final List<Map<String, dynamic>> _navItems = [
    {'title': 'Dashboard', 'icon': Icons.pie_chart_outline},
    {'title': 'Rooms', 'icon': Icons.home_outlined},
    {'title': 'Students', 'icon': Icons.people_outline},
    {'title': 'Fees', 'icon': Icons.credit_card_outlined},
    {'title': 'Attendance', 'icon': Icons.assignment_turned_in_outlined},
    {'title': 'Complaints', 'icon': Icons.error_outline},
  ];

  Widget _getPage(int index) {
    switch (index) {
      case 0: return DashboardPage(isWarden: _isWarden);
      case 1: return RoomsPage(isWarden: _isWarden);
      case 2: return StudentsPage(isWarden: _isWarden);
      case 3: return const FeesPage();
      case 4: return const AttendancePage();
      case 5: return ComplaintsPage(isWarden: _isWarden);
      default: return const Center(child: Text("Page not found"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_navItems[_selectedIndex]['title']),
        actions: [
          ActionChip(
            label: Text(_isWarden ? 'Warden' : 'Student'),
            onPressed: () => setState(() => _isWarden = !_isWarden),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF312E81)),
              child: Center(child: Text("HostelPro", style: TextStyle(color: Colors.white, fontSize: 24))),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _navItems.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(_navItems[index]['icon']),
                  title: Text(_navItems[index]['title']),
                  selected: _selectedIndex == index,
                  onTap: () {
                    setState(() => _selectedIndex = index);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: _getPage(_selectedIndex),
    );
  }
}