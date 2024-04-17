import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m1_task_manager/presentation/screen/add_new_item_task.dart';
import 'package:m1_task_manager/presentation/screen/widget/button_app_bar.dart';
import 'package:m1_task_manager/presentation/screen/widget/card_container_list.dart';
import 'package:m1_task_manager/presentation/screen/widget/class_movie_item.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final FirebaseFirestore _firebaseRE = FirebaseFirestore.instance;
  final List<MovieItem> movieList = [];
  bool _movieTaskInProgress = false;

  @override
  void initState() {
    super.initState();
    _getFirebase();
  }

  void _getFirebase() async {
    _movieTaskInProgress = true;
    setState(() {});

    try {
      await _firebaseRE.collection('movie').get().then((value) {
        for (QueryDocumentSnapshot doc in value.docs) {
          movieList.add(
              MovieItem.fromJson(doc.id, doc.data() as Map<String, dynamic>));
        }
      });
      _movieTaskInProgress = false;
    } catch (e) {
      log('Error message: ${e.toString()}');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buttonAppBar(
        'M    O     V     I    E',
      ),
      body: Visibility(
        visible: _movieTaskInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: GridView.builder(
          itemCount: movieList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: CardContainerList(
                movieList: movieList,
                index: index,
              ),
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: 170,
        child: Visibility(
          visible: _movieTaskInProgress == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal.shade50,
            ),
            onPressed: () {
              Get.to(() => const AddNewItemsTask());
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.face_unlock_rounded),
                SizedBox(
                  width: 5,
                ),
                Text('Add new item'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
