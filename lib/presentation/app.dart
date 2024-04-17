import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m1_task_manager/presentation/screen/movie_screen.dart';

class MovieHome extends StatelessWidget {
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies app',
      home:MovieScreen() ,
    );
  }
}

