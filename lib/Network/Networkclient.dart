import 'dart:convert';

import '../Model/postmodel.dart';
import 'package:http/http.dart'as http;

class Networkclient {
  Future<List<Articles>> FetchData(String category) async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=4e07598ec62f45a7bf45e9426f8be574',
        ),
      );
      if (response.statusCode == 200) {
        // Decode the JSON response
        var jsonResponse = jsonDecode(response.body);
        List<Articles> articles = [];
        for (var article in jsonResponse['articles']) {
          articles.add(Articles.fromJson(article));
        }
        return articles;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e);
      throw Exception("Failed to load data");
    }
  }
}