import 'package:flutter/material.dart';
import 'job_details.dart';
import '../../services/job_service.dart';
import '../../models/job.dart';

class JobManagement extends StatelessWidget {
  final JobService _jobService = JobService();

  JobManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Management')),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 62, 50, 67),
                            offset: Offset(0, 5),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(job.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(job.company),
                              Text(job.description),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetails(job: job),
                              ),
                            );
                          },
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            color: const Color.fromARGB(255, 143, 221, 244),
                            onPressed: () async {
                              bool confirmed = await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Job'),
                                      content: const Text(
                                          'Are you sure you want to delete this job?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ) ??
                                  false;

                              if (confirmed) {
                                await _jobService.deleteJob(job.id);
                              }
                            },
                          ),
                        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JobDetails()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
