import 'package:flutter/material.dart';

class RegisterBinPage extends StatefulWidget {
  @override
  _RegisterBinPageState createState() => _RegisterBinPageState();
}

class _RegisterBinPageState extends State<RegisterBinPage> {
  String _selectedBinSize = "Small";
  double _smallBinValue = 5;
  double _mediumBinValue = 11;
  double _largeBinValue = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Bin"),
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
              // Add menu actions
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, Javaria! Ready to register your bin?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                children: [
                  // White box for the bin image
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child:
                          Image.asset('assets/bin.jpeg', width: 50, height: 50),
                    ),
                  ),
                  SizedBox(width: 16),
                  // Separate green box for "10 Currently Registered Bins"
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "10",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                        Text("Currently Registered Bins"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter installation date",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter your address",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Select bin size in kgs",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: "Small",
                      groupValue: _selectedBinSize,
                      onChanged: (value) {
                        setState(() {
                          _selectedBinSize = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text("Small (5 - 10)"),
                    ),
                    Expanded(
                      child: Slider(
                        value: _smallBinValue,
                        min: 5,
                        max: 10,
                        divisions: 5,
                        label: _smallBinValue.toString(),
                        onChanged: (value) {
                          setState(() {
                            _smallBinValue = value;
                            _selectedBinSize = "Small";
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Medium",
                      groupValue: _selectedBinSize,
                      onChanged: (value) {
                        setState(() {
                          _selectedBinSize = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text("Medium (11 - 25)"),
                    ),
                    Expanded(
                      child: Slider(
                        value: _mediumBinValue,
                        min: 11,
                        max: 25,
                        divisions: 14,
                        label: _mediumBinValue.toString(),
                        onChanged: (value) {
                          setState(() {
                            _mediumBinValue = value;
                            _selectedBinSize = "Medium";
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Large",
                      groupValue: _selectedBinSize,
                      onChanged: (value) {
                        setState(() {
                          _selectedBinSize = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text("Large (26 - 50)"),
                    ),
                    Expanded(
                      child: Slider(
                        value: _largeBinValue,
                        min: 26,
                        max: 50,
                        divisions: 24,
                        label: _largeBinValue.toString(),
                        onChanged: (value) {
                          setState(() {
                            _largeBinValue = value;
                            _selectedBinSize = "Large";
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle bin registration
                  print("Selected Bin: $_selectedBinSize");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Register Bin",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green, // Ensure the background is green
        selectedItemColor:
            Colors.white, // Icon and text color for selected item
        unselectedItemColor:
            Colors.white70, // Icon and text color for unselected items
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
