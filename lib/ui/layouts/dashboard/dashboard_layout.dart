import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('DashboardLayout'),
      ),
    );
  }
}
