import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/lecturer.dart';
import '../widgets/lecturer_card.dart';
import 'add_lecturer_page.dart';
import 'edit_lecturer_page.dart';

class LecturerListPage extends StatefulWidget {
  const LecturerListPage({super.key});

  @override
  State<LecturerListPage> createState() => _LecturerListPageState();
}

class _LecturerListPageState extends State<LecturerListPage> {
  final List<Lecturer> lecturers = [];
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  static const String lecturersKey = 'lecturers_list';

  @override
  void initState() {
    super.initState();
    loadLecturers();
  }

  Future<void> loadLecturers() async {
    final List<String>? lecturerJsonList =
        await prefs.getStringList(lecturersKey);

    if (lecturerJsonList != null) {
      setState(() {
        lecturers.clear();
        lecturers.addAll(
          lecturerJsonList.map((json) => Lecturer.fromJson(json)).toList(),
        );
      });
    }
  }

  Future<void> saveLecturers() async {
    final List<String> lecturerJsonList =
        lecturers.map((lecturer) => lecturer.toJson()).toList();
    await prefs.setStringList(lecturersKey, lecturerJsonList);
  }

  Future<void> goToAddLecturerPage() async {
    final Lecturer? newLecturer = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddLecturerPage()),
    );

    if (newLecturer != null) {
      setState(() {
        lecturers.add(newLecturer);
      });
      await saveLecturers();
      showMessage('Lecturer added successfully');
    }
  }

  Future<void> goToEditLecturerPage(int index) async {
    final Lecturer? updatedLecturer = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditLecturerPage(lecturer: lecturers[index]),
      ),
    );

    if (updatedLecturer != null) {
      setState(() {
        lecturers[index] = updatedLecturer;
      });
      await saveLecturers();
      showMessage('Lecturer updated successfully');
    }
  }

  Future<void> deleteLecturer(int index) async {
    setState(() {
      lecturers.removeAt(index);
    });
    await saveLecturers();
    showMessage('Lecturer deleted');
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecturer List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: lecturers.isEmpty
            ? const Center(
                child: Text(
                  'No lecturers added yet',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Lecturers: ${lecturers.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: lecturers.length,
                      itemBuilder: (context, index) {
                        return LecturerCard(
                          lecturer: lecturers[index],
                          onEdit: () => goToEditLecturerPage(index),
                          onDelete: () => deleteLecturer(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToAddLecturerPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}