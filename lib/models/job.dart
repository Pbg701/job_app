import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  String id;
  String title;
  String description;
  String company;
  DateTime postedDate;

  Job(
      {required this.id,
      required this.title,
      required this.description,
      required this.company,
      required this.postedDate});

  factory Job.fromMap(Map<String, dynamic> data, String documentId) {
    return Job(
      id: documentId,
      title: data['title'],
      description: data['description'],
      company: data['company'],
      postedDate: (data['postedDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'company': company,
      'postedDate': postedDate,
    };
  }
}
