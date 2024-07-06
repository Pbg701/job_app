import 'package:flutter/material.dart';
import '../../models/job.dart';
import '../../services/job_service.dart';

class JobDetails extends StatelessWidget {
  final Job? job;

  JobDetails({super.key, this.job});

  final _formKey = GlobalKey<FormState>();
  final JobService _jobService = JobService();

  String _title = '';
  String _description = '';
  String _company = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(job == null ? 'Add Job' : 'Edit Job')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: job?.title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Job Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job title';
                  }
                  _title = value;
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: job?.description,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Job Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job description';
                  }
                  _description = value;
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: job?.company,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Company'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a company name';
                  }
                  _company = value;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 152, 239, 238)),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (job == null) {
                      await _jobService.addJob(Job(
                        id: '',
                        title: _title,
                        description: _description,
                        company: _company,
                        postedDate: DateTime.now(),
                      ));
                    } else {
                      await _jobService.updateJob(
                        job!.id,
                        Job(
                          id: job!.id,
                          title: _title,
                          description: _description,
                          company: _company,
                          postedDate: job!.postedDate,
                        ),
                      );
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
                child: Text(job == null ? 'Add Job' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
