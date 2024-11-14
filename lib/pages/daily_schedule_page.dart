import 'package:flutter/material.dart';

class DailySchedulePage extends StatefulWidget {
  @override
  _DailySchedulePageState createState() => _DailySchedulePageState();
}

class _DailySchedulePageState extends State<DailySchedulePage> {
  final List<Map<String, dynamic>> schedule = [];
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  void _addActivity() {
    setState(() {
      schedule.add({
        'activity': _activityController.text,
        'time': _timeController.text,
      });
    });
    _activityController.clear();
    _timeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jadwal Harian')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: 'Nama Kegiatan'),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Waktu (misal: 08:00 - 09:00)'),
            ),
            ElevatedButton(onPressed: _addActivity, child: Text('Tambah Kegiatan')),
            Expanded(
              child: ListView.builder(
                itemCount: schedule.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(schedule[index]['activity']),
                    subtitle: Text('Waktu: ${schedule[index]['time']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
