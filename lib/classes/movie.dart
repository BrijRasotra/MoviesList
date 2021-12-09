import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listingproject/DataModel/movie_model.dart';
import 'package:listingproject/provider/provider_one.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postMdl = context.read<ProviderOne>();
    postMdl.apiTest();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Movies List'),
      ),
        body: Consumer<ProviderOne>(
            builder: (context, val, child) => val.movieList.length == 0
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        showDetail(val.movieList[index],context);
                      },
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                val.movieList[index].image.toString(),
                                width: 120,
                                height: 120,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    val.movieList[index].title.toString(),
                                  ),
                                  Text(val.movieList[index].rating.toString()),
                                  Text(val.movieList[index].genre.toString()),
                                ],
                              ),
                              Spacer(),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Text(val.movieList[index].releaseYear
                                      .toString()))
                            ],
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 2,
                        )
                      ]),
                    ),
                    itemCount: val.movieList.length,
                  )));
  }

  void showDetail(MovieModel movieList, BuildContext context) {
    showDialog(context: context,builder:(context)=>Dialog(
      child: Container(
        child: Text(movieList.title.toString()),
      ),
    ));
  }
}
