import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/studentlist.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

TextEditingController txtName = TextEditingController();
TextEditingController txtStd = TextEditingController();
TextEditingController txtGrid = TextEditingController();
double? Grid;
int? Std;

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Add Student', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Stack(
                children: [
                  CircleAvatar(
                    maxRadius: 90,
                    backgroundImage:
                        (imagepath) != null ? FileImage(imagepath!) : null,
                  ),
                  Positioned(
                    left: 130,
                    top: 130,
                    child: IconButton(
                        onPressed: () {
                          setImage();
                        },
                        icon: Icon(
                          Icons.photo_camera_front_sharp,
                          size: 30,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: txtName,
                  decoration: InputDecoration(
                      hintText: 'Student Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: txtStd,
                        decoration: InputDecoration(
                            hintText: 'Std :',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 140,
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        controller: txtGrid,
                        decoration: InputDecoration(
                            hintText: 'grid :',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    Grid = double.parse(txtGrid.text);
                    Std = int.parse(txtStd.text);
                    addStudent.add({
                      'Name': txtName.text,
                      'std': Std,
                      'Grid': Grid,
                      'img': FileImage(imagepath!)
                    });
                    Navigator.pushNamed(context, '/');
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.tealAccent.shade700,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setImage() async {
    XFile? images = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagepath = File(images!.path);
    });
  }
}

ImagePicker picker = ImagePicker();
File? imagepath;
