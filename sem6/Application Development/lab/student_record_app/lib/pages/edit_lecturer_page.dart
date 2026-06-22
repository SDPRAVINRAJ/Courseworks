import 'package:flutter/material.dart';
import '../models/lecturer.dart';

class EditLecturerPage extends StatefulWidget {
  final Lecturer lecturer;

  const EditLecturerPage({
    super.key,
    required this.lecturer,
  });

  @override
  State<EditLecturerPage> createState() => _EditLecturerPageState();
}

class _EditLecturerPageState extends State<EditLecturerPage> {
  late TextEditingController nameController;
  late TextEditingController staffIdController;
  late TextEditingController subjectController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.lecturer.name);
    staffIdController = TextEditingController(text: widget.lecturer.staffId);
    subjectController = TextEditingController(text: widget.lecturer.subject);
  }

  void updateLecturer() {
    final String name = nameController.text.trim();
    final String staffId = staffIdController.text.trim();
    final String subject = subjectController.text.trim();

    if (name.isEmpty || staffId.isEmpty || subject.isEmpty) {
      showMessage('Please fill in all fields');
      return;
    }

    final Lecturer updatedLecturer = Lecturer(
      name: name,
      staffId: staffId,
      subject: subject,
    );

    Navigator.pop(context, updatedLecturer);
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    staffIdController.dispose();
    subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Lecturer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(
              controller: nameController,
              label: 'Lecturer Name',
              icon: Icons.person,
            ),
            buildTextField(
              controller: staffIdController,
              label: 'Staff ID',
              icon: Icons.badge,
            ),
            buildTextField(
              controller: subjectController,
              label: 'Subject',
              icon: Icons.book,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: updateLecturer,
                child: const Text('Update Lecturer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}