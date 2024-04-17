import 'package:flutter/material.dart';
import 'package:m1_task_manager/presentation/screen/movie_trailer_videos_screen.dart';
import 'package:m1_task_manager/presentation/screen/widget/class_movie_item.dart';

class CardContainerList extends StatefulWidget {
  const CardContainerList({
    super.key,
    required this.movieList,
    required this.index,
  });

  final int index;
  final List<MovieItem> movieList;

  @override
  State<CardContainerList> createState() => _CardContainerListState();
}

class _CardContainerListState extends State<CardContainerList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MoviesTrailerVideosScreen(
                    index: widget.index,
                    movieList: widget.movieList,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              height: 190,
              width: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 110,
                      child: Image.network(
                        widget.movieList[widget.index].urlDownload,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 50,
                      child: GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${widget.movieList[widget.index].name}",
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Language: ${widget.movieList[widget.index].language}",
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
