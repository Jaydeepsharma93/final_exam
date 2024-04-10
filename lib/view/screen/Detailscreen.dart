import 'package:flutter/material.dart';

import '../../utils/studentlist.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({super.key});

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

int Index = 0;

class _StudentDetailState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Student Detail',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CircleAvatar(
                  maxRadius: 110, backgroundImage: addStudent[Index]['img']),
              ListTile(
                title: Text(
                  "Name : ${addStudent[Index]['Name']}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'std : ${addStudent[Index]['std']}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  'Grid : ${addStudent[Index]['Grid']}%',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,height: -1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
