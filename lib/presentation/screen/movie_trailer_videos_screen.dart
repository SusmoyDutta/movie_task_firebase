import 'package:flutter/material.dart';
import 'package:m1_task_manager/presentation/screen/widget/button_app_bar.dart';
import 'package:m1_task_manager/presentation/screen/widget/class_movie_item.dart';

class MoviesTrailerVideosScreen extends StatefulWidget {
  const MoviesTrailerVideosScreen({
    super.key,
    required this.movieList,
    required this.index,
  });

  final int index;
  final List<MovieItem> movieList;

  @override
  State<MoviesTrailerVideosScreen> createState() =>
      _MoviesTrailerVideosScreenState();
}

class _MoviesTrailerVideosScreenState extends State<MoviesTrailerVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buttonAppBar('Movies Details'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 650,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(

                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 350,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.network(widget.movieList[widget.index].urlDownload),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Name:${widget.movieList[widget.index].name} "),

                    Text("Language:${widget.movieList[widget.index].language} "),

                    Text("Initial release: ${widget.movieList[widget.index].initialrelease}"),
                    Text("Reviews:${widget.movieList[widget.index].reviews}"),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Description:${widget.movieList[widget.index].description}",maxLines: 10,),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
