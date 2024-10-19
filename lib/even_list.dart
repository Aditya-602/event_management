import 'package:flutter/material.dart';
import 'add_event.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<Map<String, String>> events = [
    {"title": "Hackathon", "date": "2024-10-20"},
    {"title": "Seminar on AI", "date": "2024-11-05"},
    {"title": "Tech Talk", "date": "2024-12-01"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              // Navigate to AddEventScreen and wait for the result
              final newEvent = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEventScreen()),
              );

              // Check if an event was added and then update the state
              if (newEvent != null) {
                setState(() {
                  events.add(newEvent);
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 tiles per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: InkWell(
                onTap: () {
                  // Handle tile tap (e.g., show event details or registration)
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 255, 255, 255),
                        const Color.fromARGB(255, 255, 255, 255)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        events[index]['title']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Date: ${events[index]['date']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(179, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
