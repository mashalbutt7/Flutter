import 'package:flutter/material.dart';
import 'package:flutter_application_1/feedback_page.dart';
import 'package:flutter_application_1/feedback_responses.dart';
import 'package:flutter_application_1/register_bin_page.dart';

class AdminGridSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {
        "image": 'assets/bin.jpeg',
        "label": "Register Bin",
        "page": RegisterBinPage()
      },
      {
        "image": 'assets/feedback.png',
        "label": "Provide Feedback",
        "page": ProvideFeedbackPage()
      },
      {
        "image": 'assets/feedbackreply.jpg',
        "label": "View Feedback Response",
        "page": FeedbackResponseScreen()
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 27, right: 27),
      child: GridView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // Prevent inner scrolling
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
          childAspectRatio: 1.5, // Adjusted to reduce width of grid buttons
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the selected page on button click
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => options[index]['page']),
              );
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color(0xFF2E7835), width: 3), // Border outline
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    options[index]['image'],
                    width:
                        50, // Adjusted to be the same size as ResidentHomePage
                    height:
                        50, // Adjusted to be the same size as ResidentHomePage
                    fit:
                        BoxFit.contain, // Ensures the image fits inside the box
                  ),
                  SizedBox(height: 8), // Space between the image and text
                  Text(
                    options[index]['label'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
