import 'package:flutter/material.dart';
import 'job_list.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('User Dashboard')),
      body: JobList(),
    );
  }
}
