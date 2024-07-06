import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job.dart';

class JobService {
  final CollectionReference jobCollection =
      FirebaseFirestore.instance.collection('jobs');

  Future<DocumentReference<Object?>> addJob(Job job) async {
    return await jobCollection.add(job.toMap());
  }

  Future<void> updateJob(String id, Job job) async {
    return await jobCollection.doc(id).update(job.toMap());
  }

  Future<void> deleteJob(String id) async {
    return await jobCollection.doc(id).delete();
  }

  Stream<List<Job>> getJobs() {
    return jobCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Job.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
