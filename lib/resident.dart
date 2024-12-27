import 'package:flutter/material.dart';
import 'residentbottompage.dart';
import 'residentprofile.dart';
import 'residentgridselection.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F3EC),
        title: const Text(
          'Admin Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: const Color(0xFFE6F3EC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Divider for better UI
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            adminprofilesection(), // profile section called
            AdminGridSection(),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}
