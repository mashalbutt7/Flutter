import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For date formatting

// Assuming AdminBottomSection is defined elsewhere and imported here.
import 'residentbottompage.dart'; // Replace with the actual path

class FeedbackResponseScreen extends StatefulWidget {
  @override
  _FeedbackResponseScreenState createState() => _FeedbackResponseScreenState();
}

class _FeedbackResponseScreenState extends State<FeedbackResponseScreen> {
  final CollectionReference feedbackResponses =
      FirebaseFirestore.instance.collection('feedbackResponses');

  DateTime? selectedDate; // To store selected date

  // Function to format the date for Firebase filtering
  Timestamp? getTimestampForSelectedDate() {
    if (selectedDate == null) return null;

    // Set the time to midnight to compare just the date part
    final date = DateTime(selectedDate!.year, selectedDate!.month,
        selectedDate!.day, 0, 0, 0); // Midnight time
    return Timestamp.fromDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Response'),
        backgroundColor: const Color(0xFFEFF4E9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'View the responses to your submitted feedback below',
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
                // Date Picker for selecting date
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
                // If a date is selected, filter the data based on that date
                stream: selectedDate != null
                    ? feedbackResponses
                        .where(
                          'date', // Assuming 'date' is the field in Firestore
                          isGreaterThanOrEqualTo: getTimestampForSelectedDate(),
                        )
                        .where(
                          'date',
                          isLessThan: getTimestampForSelectedDate()!
                              .toDate()
                              .add(const Duration(
                                  days: 1)), // Get until the end of the day
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

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical, // Allow vertical scrolling
                    child: SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal, // Allow horizontal scrolling
                      child: DataTable(
                        columnSpacing: 16, // Adjust column spacing
                        columns: const [
                          DataColumn(label: Text('Feedback ID')),
                          DataColumn(label: Text('Response')),
                          DataColumn(label: Text('Contact Person')),
                        ],
                        rows: feedbackData.map((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          return DataRow(cells: [
                            DataCell(Text(data['feedbackID'].toString())),
                            DataCell(Text(data['response'])),
                            DataCell(Text(data['contactPerson'])),
                          ]);
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomSection(), // Integrated Bottom Section
    );
  }
}
