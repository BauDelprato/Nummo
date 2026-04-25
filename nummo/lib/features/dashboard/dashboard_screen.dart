import 'package:flutter/material.dart';
//import 'package:provider/provider.dart'; //x si acaso
import '../../shared/widgets/custom_button.dart';
import '../../core/utils/helpers.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('TODO: Summary cards for savings, goals, transactions'),
          ],
        ),
      ),
    );
  }
}
