import 'dart:convert';

class Lecturer {
  String name;
  String staffId;
  String subject;

  Lecturer({
    required this.name,
    required this.staffId,
    required this.subject,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'staffId': staffId,
      'subject': subject,
    };
  }

  factory Lecturer.fromMap(Map<String, dynamic> map) {
    return Lecturer(
      name: map['name'] ?? '',
      staffId: map['staffId'] ?? '',
      subject: map['subject'] ?? '',
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory Lecturer.fromJson(String source) {
    return Lecturer.fromMap(jsonDecode(source));
  }
}