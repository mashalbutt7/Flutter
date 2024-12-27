import 'package:flutter/material.dart';
import 'residentbottompage.dart';

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
        padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
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
                color: const Color(0xFF2E7835),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                children: [
                  // White box for the bin image
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child:
                          Image.asset('assets/bin.png', width: 50, height: 50),
                    ),
                  ),
                  SizedBox(width: 18),
                  // Separate green box for "10 Currently Registered Bins"
                  Container(
                    width: 220,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
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
                            color: const Color(0xFF2E7835),
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
            SizedBox(height: 16), // Adds space after the address input field
            SizedBox(height: 18),
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
            SizedBox(height: 45), // Move button up by reducing the space
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle bin registration
                  print("Selected Bin: $_selectedBinSize");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7835),
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
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}
