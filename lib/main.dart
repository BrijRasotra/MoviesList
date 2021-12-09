import 'dart:io';
import 'package:flutter/material.dart';
import 'package:listingproject/profilepage/listpage.dart';
import 'package:listingproject/provider/provider_one.dart';
import 'package:provider/provider.dart';

import 'classes/movie.dart';


void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp( MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:ChangeNotifierProvider(create: (_)=>ProviderOne(),
      child: MoviePage(),)
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
