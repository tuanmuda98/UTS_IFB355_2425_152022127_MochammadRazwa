import 'package:flutter/material.dart';

class BudgetTimeCalculatorPage extends StatefulWidget {
  @override
  _BudgetTimeCalculatorPageState createState() =>
      _BudgetTimeCalculatorPageState();
}

class _BudgetTimeCalculatorPageState extends State<BudgetTimeCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _timeController = TextEditingController();

  double workTime = 0;
  double breakTime = 0;
  double studyTime = 0;
  double entertainmentTime = 0;

  // Fungsi untuk menghitung waktu yang dibagi
  void _calculateTime() {
    if (_formKey.currentState!.validate()) {
      double totalTime = double.parse(_timeController.text);

      setState(() {
        workTime = totalTime * 0.5; // 50% untuk pekerjaan
        breakTime = totalTime * 0.2; // 20% untuk istirahat
        studyTime = totalTime * 0.2; // 20% untuk belajar
        entertainmentTime = totalTime * 0.1; // 10% untuk hiburan
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Time Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Masukkan waktu total yang Anda miliki (dalam jam):',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(labelText: 'Total Waktu (Jam)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan waktu total terlebih dahulu';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateTime,
                child: Text('Hitung'),
              ),
              SizedBox(height: 20),
              if (workTime > 0)
                Column(
                  children: [
                    Text(
                      'Pekerjaan: ${workTime.toStringAsFixed(2)} jam',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Istirahat: ${breakTime.toStringAsFixed(2)} jam',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Belajar: ${studyTime.toStringAsFixed(2)} jam',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Hiburan: ${entertainmentTime.toStringAsFixed(2)} jam',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

