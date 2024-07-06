import 'package:flutter/material.dart';
import '../../models/job.dart';

class JobApply extends StatelessWidget {
  final Job job;

  JobApply({super.key, required this.job});

  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _resume = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apply for ${job.title}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Title: ${job.title}'),
              Text('Company: ${job.company}'),
              Text('Description: ${job.description}'),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Resume'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your resume';
                  }
                  _resume = value;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Show snackbar on successful application
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You have applied successfully'),
                        backgroundColor: Color.fromARGB(255, 9, 14, 14),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 145, 252, 252),
                  ),
                ),
                child: const Text('Apply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
