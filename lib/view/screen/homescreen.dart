import 'package:flutter/material.dart';

import '../../utils/studentlist.dart';
import 'Detailscreen.dart';
import 'addstudentdata.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Student Data',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: addStudent.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              leading: InkWell(
                onTap: () {
                  Index = index;
                  Navigator.pushNamed(context, '/detail');
                },
                child: CircleAvatar(
                  maxRadius: 30,
                  backgroundImage:addStudent[index]['img'],
                ),
              ),
              title: Text(
                addStudent[index]['Name'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('std : ${addStudent[index]['std']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {
                    setState(() {
                      addStudent.removeAt(index);
                    });
                  }, icon: Icon(Icons.delete))
                  ],
              )
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
