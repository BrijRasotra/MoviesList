import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:listingproject/profilepage/component/imagepage.dart';

class MovieList extends StatefulWidget {
  @override
  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<MovieList> {
  var res;
  var apilength = 0;

  @override
  void initState() {
    ApiTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF8BBD0),
        leading: BackButton(
          color: Color(0xFF880E4F),
        ),
        title: Center(
            child: Text(
          'Movies',
          style: TextStyle(color: Color(0xFF880E4F)),
        )),
        actions: [
          Icon(
            Icons.menu,
            color: Color(0xFF880E4F),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Hero(
                      tag: res[index]['image'],
                      child: Image.network(
                        res[index]['image'],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${res[index]['title'].toString()}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rating:-${res[index]['rating'].toString()}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('${getData(res[index]['genre'])}',
                            style: TextStyle(fontSize: 14)),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '${res[index]['releaseYear'].toString()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
                color: Colors.black26,
                thickness: 1,
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImagePage(res[index]['image']),
                ));
          },
        ),
        itemCount: apilength,
      ),
    );
  }

  Future<void> ApiTest() async {
    var url = Uri.parse('https://api.androidhive.info/json/movies.json');
    var response = await http.get(url).timeout(Duration(seconds: 20));
    res = jsonDecode(response.body);
    print(res);
    setState(() {
      apilength = res.length;
    });
  }

  getData(List<dynamic> data) {
    String cc = ' ';
    for (int i = 0; i < data.length; i++) {
      cc += data[i] + ',';
    }
    return cc;
  }
}
