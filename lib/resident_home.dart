import 'package:flutter/material.dart';
import 'resident_menu.dart';
import 'residentbottompage.dart';

class ResidentHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resident Home"),
      ),
      endDrawer: ResidentMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Green section with data analytics button (now clickable)
            GestureDetector(
              onTap: () {
                // Navigate to another page when clicked
                Navigator.pushNamed(context, '/data_analytics_page');
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(12), // Reduced padding
                decoration: BoxDecoration(
                  color: const Color(0xFF2E7835), // Green background
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Javaria Shabbir",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white), // White text
                            ),
                            Text(
                              "Resident",
                              style:
                                  TextStyle(color: Colors.white), // White text
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Data Analytics Section
                    Container(
                      padding: const EdgeInsets.all(12), // Reduced padding
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Text Section
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Center "Data" and "Analytics" text
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Data",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Analytics",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Image Section (slightly reduced width)
                          Container(
                            height: 90,
                            width: 180, // Reduced width of image
                            child: Image.asset(
                              'assets/dataanalytics.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Vertical buttons for actions (unchanged)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/resident_bin_page');
                          },
                          child: Image.asset(
                            'assets/bin.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Register Bin",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/feedback_page');
                          },
                          child: Image.asset(
                            'assets/feedback.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Provide Feedback",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/feedback_responses');
                          },
                          child: Image.asset(
                            'assets/feedbackreply.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "View Feedback Response",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: residentBottomSection(),
    );
  }
}
