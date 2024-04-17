import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:m1_task_manager/presentation/screen/widget/button_app_bar.dart';

class AddNewItemsTask extends StatefulWidget {
  const AddNewItemsTask({super.key});

  @override
  State<AddNewItemsTask> createState() => _AddNewItemsTaskState();
}

class _AddNewItemsTaskState extends State<AddNewItemsTask> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _languageTEController = TextEditingController();
  final TextEditingController _initialTEController = TextEditingController();
  final TextEditingController _reviewsTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  PlatformFile? platformFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buttonAppBar('M O V I E  D E T A I L S  A D D '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _fromKey,
                child: Container(
                  height: 780,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Input add a new test,images/videos',
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _nameTEController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Name',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Please enter your name.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _languageTEController,
                          decoration: InputDecoration(
                            labelText: 'Language',
                            hintText: 'Language',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Please enter your language.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _initialTEController,
                          decoration: InputDecoration(
                            labelText: 'Initial release',
                            hintText: 'Initial release',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Please enter your initial release.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _reviewsTEController,
                          decoration: InputDecoration(
                            labelText: 'Reviews',
                            hintText: 'Reviews',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Please enter your reviews.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _descriptionTEController,
                          maxLines: 6,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: 'Description',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Please enter your description.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () {
                            selectFilePicker();
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(Icons.photo),
                                      Text(
                                        '/',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(Icons.video_collection_sharp),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(platformFile?.name ?? ''),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_fromKey.currentState!.validate()) {
                              listFileUpDate();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Success upload'),
                                  backgroundColor: Colors.lightGreenAccent,
                                ),
                              );
                              Navigator.pop;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade200,
                            ),
                            height: 50,
                            width: 200,
                            child:
                                const Icon(Icons.arrow_circle_right_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void listFileUpDate() {
    movieListUpDateFile();
  }

  Future<void> selectFilePicker() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      platformFile = result.files.single;
    });
  }

  Future<void> movieListUpDateFile() async {
    try {
      final path = 'Files/${platformFile?.name ?? ''}';
      final file = File(platformFile?.path ?? '');
      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      log('Download Link: $urlDownload');
      CollectionReference collectionReferenceAdd =
          FirebaseFirestore.instance.collection('movie');
      collectionReferenceAdd.add({
        'name': _nameTEController.text.trim(),
        'description': _descriptionTEController.text.trim(),
        'initialrelease': _initialTEController.text.trim(),
        'language': _languageTEController.text.trim(),
        'reviews': _reviewsTEController.text.trim(),
        'urlDownload': urlDownload,
      });
    } catch (e) {
      log(e.toString());
    }
    _nameTEController.clear();
    _descriptionTEController.clear();
    _initialTEController.clear();
    _languageTEController.clear();
    _reviewsTEController.clear();
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _languageTEController.dispose();
    _descriptionTEController.dispose();
    _initialTEController.dispose();
    _reviewsTEController.dispose();
    super.dispose();
  }
}

//Dear learners, please join the support class now if possible. Maybe I won't take the class much longer due to electricity and network.
//WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

// your code

//});
