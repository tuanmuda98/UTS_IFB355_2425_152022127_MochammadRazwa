import 'package:flutter/material.dart';
import 'dart:async';

class TimeTrackerPage extends StatefulWidget {
  @override
  _TimeTrackerPageState createState() => _TimeTrackerPageState();
}

class _TimeTrackerPageState extends State<TimeTrackerPage> {
  final List<Map<String, dynamic>> activities = [];
  final TextEditingController _activityController = TextEditingController();
  Timer? _timer;
  int _elapsedTime = 0; // in seconds
  String _timerStatus = 'Mulai Aktivitas';

  void _startTimer(String activityName) {
    setState(() {
      activities.add({
        'activity': activityName,
        'time': 0,
      });
      _elapsedTime = 0;
      _timerStatus = 'Sedang Berjalan';
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime++;
        activities[activities.length - 1]['time'] = _elapsedTime;
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _timer?.cancel();
      _timerStatus = 'Selesai';
    });
  }

  void _addActivity() {
    if (_activityController.text.isNotEmpty) {
      _startTimer(_activityController.text);
      _activityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pelacak Waktu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: 'Nama Aktivitas'),
            ),
            ElevatedButton(
                onPressed: _addActivity, child: Text('Tambah Aktivitas')),
            SizedBox(height: 20),
            Text('Status: $_timerStatus', style: TextStyle(fontSize: 20)),
            Text('Waktu yang dihabiskan: $_elapsedTime detik'),
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(activities[index]['activity']),
                    subtitle: Text('Waktu: ${activities[index]['time']} detik'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _stopTimer,
              child: Text('Berhenti'),
            ),
          ],
        ),
      ),
    );
  }
}
