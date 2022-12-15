import 'dart:convert';

import '../model/news_article_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsApi{

  Future<List<NewsArticleModel>> getHeadlineNews() async {

    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=5303453b329345258774a8126f31c6c8';
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List articlesInJson = jsonData['articles'];
    List articlesInUse = [];

    if(jsonData['status'] == "ok"){
      for(var element in articlesInJson){
        if(element['urlToImage'] != null && element['description'] != null && element['url'] != null && element['title'] != null){
          articlesInUse.add(element);
        }
      }
      return articlesInUse.map((data) => NewsArticleModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List<NewsArticleModel>> getHeadlineNewsFilteredByCategory(String? category) async {

    String url = 'https://newsapi.org/v2/top-headlines?category=$category&apiKey=5303453b329345258774a8126f31c6c8';
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List articlesInJson = jsonData['articles'];
    List articlesInUse = [];

    if(jsonData['status'] == "ok"){
      for(var element in articlesInJson){
        if(element['urlToImage'] != null && element['description'] != null && element['url'] != null && element['title'] != null){
          articlesInUse.add(element);
        }
      }
      return articlesInUse.map((data) => NewsArticleModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List<NewsArticleModel>> getHeadlineNewsFilteredByCountry(String? country) async {

    String url = 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=5303453b329345258774a8126f31c6c8';
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List articlesInJson = jsonData['articles'];
    List articlesInUse = [];

    if(jsonData['status'] == "ok"){
      for(var element in articlesInJson){
        if(element['urlToImage'] != null && element['description'] != null && element['url'] != null && element['title'] != null){
          articlesInUse.add(element);
        }
      }
      return articlesInUse.map((data) => NewsArticleModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List<NewsArticleModel>> getGlobalNews() async {

    DateTime today = DateTime.now();
    DateFormat formatDate = DateFormat('yyyy-MM-dd');
    String formattedDate = formatDate.format(today);

    String url = 'https://newsapi.org/v2/everything?q=a&from=$formattedDate&to=$formattedDate&language=en&sortBy=relevancy&apiKey=5303453b329345258774a8126f31c6c8';
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List articlesInJson = jsonData['articles'];

    List articlesInUse = [];

    if(jsonData['status'] == "ok"){
      for(var element in articlesInJson){
        if(element['urlToImage'] != null && element['description'] != null && element['url'] != null && element['title'] != null){
          if(!element['description'].toString().contains('<') || !element['description'].toString().contains('/>') ||
              !element['description'].toString().contains('</') ||!element['description'].toString().contains("<a/>")||
              !element['description'].toString().contains("<a href=")){
            articlesInUse.add(element);
          }
        }
      }
      return articlesInUse.map((data) => NewsArticleModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List<NewsArticleModel>> getGlobalNewsFilteredByLanguage(String? language) async {

    String url = 'https://newsapi.org/v2/everything?q=a&language=$language&apiKey=5303453b329345258774a8126f31c6c8';
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List articlesInJson = jsonData['articles'];

    List articlesInUse = [];

    if(jsonData['status'] == "ok"){
      for(var element in articlesInJson){
        if(element['urlToImage'] != null && element['description'] != null && element['url'] != null && element['title'] != null){
          if(!element['description'].toString().contains('<') || !element['description'].toString().contains('/>') ||
              !element['description'].toString().contains('</') ||!element['description'].toString().contains("<a/>")||
              !element['description'].toString().contains("<a href=")){
            articlesInUse.add(element);
          }
        }
      }
      return articlesInUse.map((data) => NewsArticleModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List<NewsArticleModel>> getGlobalNewsFilteredBySortBy(String? sortBy) async {

    String url = 'https://newsapi.org/v2/everything?q=a&sortBy=$sortBy&apiKey=5303453b329345258774a8126f31c6c8';
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List articlesInJson = jsonData['articles'];

    List articlesInUse = [];

    if(jsonData['status'] == "ok"){
      for(var element in articlesInJson){
        if(element['urlToImage'] != null && element['description'] != null && element['url'] != null && element['title'] != null){
          if(!element['description'].toString().contains('<') || !element['description'].toString().contains('/>') ||
              !element['description'].toString().contains('</') ||!element['description'].toString().contains("<a/>")||
              !element['description'].toString().contains("<a href=")){
            articlesInUse.add(element);
          }
        }
      }
      return articlesInUse.map((data) => NewsArticleModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List<NewsArticleModel>> getNewsBySearchQuery(String query) async {

    String url = 'https://newsapi.org/v2/everything?q=$query&language=en&apiKey=5303453b329345258774a8126f31c6c8';
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List articlesInJson = jsonData['articles'];
    var articlesInUse = [];

    if(jsonData['status'] == "ok"){
      for(var element in articlesInJson){
        if(element['urlToImage'] != null && element['description'] != null && element['url'] != null && element['title'] != null){
          if(!element['description'].toString().contains('<') || !element['description'].toString().contains('/>') ||
          !element['description'].toString().contains('</') ||!element['description'].toString().contains("<a/>")||
              !element['description'].toString().contains("<a href=")){
            articlesInUse.add(element);
          }
        }
      }
      return articlesInUse.map((data) => NewsArticleModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

}