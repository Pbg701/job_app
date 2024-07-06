import 'package:flutter/material.dart';
import '../../services/job_service.dart';
import '../../models/job.dart';
import 'job_apply.dart';

class JobList extends StatelessWidget {
  final JobService _jobService = JobService();

  JobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job List')),
      body: StreamBuilder<List<Job>>(
        stream: _jobService.getJobs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Job> jobs = snapshot.data!;
            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                Job job = jobs[index];
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 15, 17, 16),
                            offset: Offset(0, 5),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(job.title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(job.company),
                            const SizedBox(height: 4),
                            Text(job.description),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobApply(job: job),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
