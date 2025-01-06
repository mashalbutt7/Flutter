import 'package:flutter/material.dart';
import 'residentbottompage.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Your waste pickup is scheduled for tomorrow.",
      "isOpened": false
    },
    {
      "title": "Recycling drive happening in your area this weekend.",
      "isOpened": false
    },
    {
      "title":
          "Collection delayed due to maintenance. Updated schedule: Jan 5.",
      "isOpened": false
    },
    {
      "title": "New waste segregation rules implemented in your locality.",
      "isOpened": false
    },
    {
      "title": "Your request for additional bins has been approved.",
      "isOpened": false
    },
    {
      "title":
          "Reminder: Dispose of e-waste responsibly at our collection center.",
      "isOpened": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xFFEFF4E9), // Green-themed AppBar
      ),
      body: Container(
        color: Color(0xFFEFF4E9), // Light background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: notifications.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.green,
                ),
                title: Text(
                  notifications[index]["title"],
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: notifications[index]["isOpened"]
                        ? FontWeight.normal
                        : FontWeight.bold, // Bold if not opened
                  ),
                ),
                subtitle: Text(
                  "Received on: ${DateTime.now().subtract(Duration(days: index)).toLocal()}",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {
                    notifications[index]["isOpened"] = true; // Mark as opened
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Notification Details'),
                        content: Text(notifications[index]["title"]),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}
