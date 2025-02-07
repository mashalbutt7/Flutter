import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'residentbottompage.dart'; // Replace with the actual path for the bottom navigation.

class FeedbackResponseScreen extends StatefulWidget {
  @override
  _FeedbackResponseScreenState createState() => _FeedbackResponseScreenState();
}

class _FeedbackResponseScreenState extends State<FeedbackResponseScreen> {
  final CollectionReference feedbackResponses =
      FirebaseFirestore.instance.collection('feedbackResponses');

  DateTime? selectedDate;

  Timestamp? getTimestampForSelectedDate() {
    if (selectedDate == null) return null;

    final date = DateTime(
        selectedDate!.year, selectedDate!.month, selectedDate!.day, 0, 0, 0);
    return Timestamp.fromDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Responses'),
        backgroundColor: const Color(0xFFEFF4E9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'View the responses to your submitted feedback below.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Select date:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    selectedDate == null
                        ? 'Select Date'
                        : DateFormat('dd-MM-yyyy').format(selectedDate!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: selectedDate != null
                    ? feedbackResponses
                        .where(
                          'date',
                          isGreaterThanOrEqualTo: getTimestampForSelectedDate(),
                        )
                        .where(
                          'date',
                          isLessThan: getTimestampForSelectedDate()!
                              .toDate()
                              .add(const Duration(days: 1)),
                        )
                        .snapshots()
                    : feedbackResponses.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text('No feedback responses found.'));
                  }

                  final feedbackData = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: feedbackData.length,
                    itemBuilder: (context, index) {
                      final data =
                          feedbackData[index].data() as Map<String, dynamic>;
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Feedback ID: ${data['feedbackID']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Response: ${data['response']}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Contact Person: ${data['contactPerson']}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Date: ${DateFormat('dd-MM-yyyy').format((data['date'] as Timestamp).toDate())}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: residentBottomSection(),
    );
  }
}
