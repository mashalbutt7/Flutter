import 'package:flutter/material.dart';
import 'residentbottompage.dart';

class ProvideFeedbackPage extends StatefulWidget {
  @override
  _ProvideFeedbackPageState createState() => _ProvideFeedbackPageState();
}

class _ProvideFeedbackPageState extends State<ProvideFeedbackPage> {
  String _feedbackType = "Suggestions";
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provide Feedback"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Menu actions
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Help us improve by sharing your thoughts and suggestions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7835),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "How would you rate us?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return IconButton(
                                icon: Icon(
                                  index < _rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _rating = index + 1.0;
                                  });
                                },
                              );
                            }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Poor",
                                  style: TextStyle(color: Colors.white)),
                              Text("Excellent",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Feedback Type:",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 21, 98, 161)),
                    ),
                    Column(
                      children: [
                        RadioListTile<String>(
                          title: Text("Complains"),
                          value: "Complains",
                          groupValue: _feedbackType,
                          onChanged: (value) {
                            setState(() {
                              _feedbackType = value!;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Text("Suggestions"),
                          value: "Suggestions",
                          groupValue: _feedbackType,
                          onChanged: (value) {
                            setState(() {
                              _feedbackType = value!;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Text("Questions"),
                          value: "Questions",
                          groupValue: _feedbackType,
                          onChanged: (value) {
                            setState(() {
                              _feedbackType = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Share your feedback",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 21, 98, 161)),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Write here......",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle feedback submission
                          print("Feedback Type: $_feedbackType");
                          print("Rating: $_rating");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7835),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Send",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: residentBottomSection(),
    );
  }
}
