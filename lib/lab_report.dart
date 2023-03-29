import 'dart:io';
import 'pre_process.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LabReportScreen extends StatefulWidget {
  const LabReportScreen({Key? key}) : super(key: key);

  @override
  _LabReportScreenState createState() => _LabReportScreenState();
}

class _LabReportScreenState extends State<LabReportScreen> {
  Map<String, String> _imagePaths = {
    'fecal': '',
    'urine': '',
    'hemoglobin': '',
    'erythrocyteCount': '',
    'packedCellCount': '',
    'leukocyteCount': '',
    'differentialCount': '',
    'kidneyFunction': '',
    'liverFunction': '',
    'others': '',
  };

  final picker = ImagePicker();

  Future<void> _getImage(String field) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _imagePaths = {..._imagePaths, field: pickedFile.path};
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getGalleryImage(String field) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imagePaths = {..._imagePaths, field: pickedFile.path};
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _buildImage(String field) {
    String? _path = _imagePaths[field];
    if (_path != null && _path.isNotEmpty) {
      return SizedBox(
        height: 200,
        child: Image.file(File(_path), fit: BoxFit.cover),
      );
    } else {
      return const Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Report'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Fecal Examination Report',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('fecal'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('fecal'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('fecal'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Urine Analysis',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('urine'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('urine'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('urine'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Hemoglobin Estimation',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('hemoglobin'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('hemoglobin'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('hemoglobin'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Total Erythrocyte Count',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('erythrocyteCount'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('erythrocyteCount'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('erythrocyteCount'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Packed Cell Volume Count',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('packedCellCount'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('packedCellCount'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('packedCellCount'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Total Leukocyte Count',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('leukocyteCount'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('leukocyteCount'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('leukocyteCount'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Differential Leukocyte Count',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('differentialCount'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('differentialCount'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('differentialCount'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Kidney Function Test',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('kidneyFunction'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('kidneyFunction'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('kidneyFunction'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Liver Function Test',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('liverFunction'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('liverFunction'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('liverFunction'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Others',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 200,
              child: _buildImage('others'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () => _getImage('others'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _getGalleryImage('others'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the pre-process screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PreProcessScreen()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
