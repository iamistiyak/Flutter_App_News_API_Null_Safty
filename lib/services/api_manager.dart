import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/strings.dart';
import '../models/newsInfo.dart';



// ignore: camel_case_types
class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        // debugPrint(response.body.toString());

        var jsonString = response.body;
        // debugPrint("Json String :"+ jsonString);
        // print(jsonString.runtimeType);

        var jsonMap = json.decode(jsonString);
        // debugPrint("Json String :");
        // print(jsonMap.runtimeType);

        newsModel = NewsModel.fromJson(jsonMap);
        // debugPrint(newsModel.toString());

      }
    } catch (e) {
      // debugPrint(e.toString());
      return newsModel;
    }
    return newsModel;
  }
}

