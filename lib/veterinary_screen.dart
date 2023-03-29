import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/lab_report.dart';

class VeterinaryScreen extends StatefulWidget {
  const VeterinaryScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VeterinaryScreenState createState() => _VeterinaryScreenState();
}

class _VeterinaryScreenState extends State<VeterinaryScreen> {
  int _selectedSpecies = 0;
  final List<String> _speciesList = [
    'Bovine',
    'Caprine',
    'Canine',
    'Porcine',
    'Feline',
    'Equine',
  ];
  double _temperature = 0.0;
  DateTime? _vaccinationDate;
  DateTime? _DewormingDate;
  String _symptoms = '';
  DateTime? _symptomsDate;

  int _selectedSex = 0;
  final List<String> _sexList = [
    'Male',
    'Female',
  ];

  int _pulseRate = 0;

  int _heartRate = 0;

  int _respiratoryRate = 0;

  int _bodyWeight = 0;

  String _weightUnit = 'kg';
  final List<String> _weightUnits = ['kg', 'g'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veterinary Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Text('Species'),
            CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() {
                  _selectedSpecies = value;
                });
              },
              children: [
                for (String species in _speciesList) Text(species),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Symptoms'),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Describe your symptoms',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
              onChanged: (value) {
                setState(() {
                  _symptoms = value;
                });
              },
            ),
            Row(
              children: [
                const SizedBox(height: 16),
                const Text('Symptoms first observed on'),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _symptomsDate = pickedDate;
                        });
                      }
                    },
                    child: Text(_symptomsDate == null
                        ? 'Select Date'
                        : 'Date: ${_symptomsDate.toString().substring(0, 10)}'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Sex'),
            CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() {
                  _selectedSex = value;
                });
              },
              children: [
                for (String sex in _sexList) Text(sex),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Pulse Rate'),
            CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() {
                  _pulseRate = value;
                });
              },
              children: [
                for (int i = 0; i <= 200; i++) Text(i.toString()),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Heart Rate'),
            CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() {
                  _heartRate = value;
                });
              },
              children: [
                for (int i = 0; i <= 200; i++) Text(i.toString()),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Temperature'),
            CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() {
                  _temperature = value.toDouble();
                });
              },
              children: [
                for (double i = 0; i <= 100; i += 0.1)
                  Text(i.toStringAsFixed(1)),
              ],
            ),
            Row(
              children: [
                const SizedBox(height: 16),
                const Text('Recent Vaccination Date'),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _vaccinationDate = pickedDate;
                        });
                      }
                    },
                    child: Text(_vaccinationDate == null
                        ? 'Select Date'
                        : 'Date: ${_vaccinationDate.toString().substring(0, 10)}'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(height: 16),
                const Text('Recent Deworming Date'),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _DewormingDate = pickedDate;
                        });
                      }
                    },
                    child: Text(_DewormingDate == null
                        ? 'Select Date'
                        : 'Date: ${_DewormingDate.toString().substring(0, 10)}'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Respiratory Rate'),
            CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() {
                  _respiratoryRate = value;
                });
              },
              children: [
                for (int i = 0; i <= 100; i++) Text(i.toString()),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(height: 16),
                const Text('Body Weight'),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter body weight',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _bodyWeight = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _weightUnit,
                  onChanged: (String? value) {
                    setState(() {
                      _weightUnit = value!;
                    });
                  },
                  items: _weightUnits
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text("next"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LabReportScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
