import 'package:flutter/material.dart';
import 'package:news_api/api/news_api.dart';
import 'package:news_api/widget/headline_card.dart';

import '../model/news_article_model.dart';

class HeadlineNewsView extends StatefulWidget {
  const HeadlineNewsView({Key? key}) : super(key: key);

  @override
  State<HeadlineNewsView> createState() => _HeadlineNewsViewState();
}

class _HeadlineNewsViewState extends State<HeadlineNewsView> {
  late Future<List<NewsArticleModel>> newsArticles;

  @override
  void initState() {
    super.initState();
    NewsApi newsApi = NewsApi();
    newsArticles = newsApi.getHeadlineNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<NewsArticleModel>>(
        future: newsArticles,
        builder: (context, snapshot){
      if (snapshot.hasData) {
        List<NewsArticleModel>? data = snapshot.data;

        return SingleChildScrollView(
          child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                itemCount: data!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return HeadlineCard(
                      imageUrl: data[index].urlToImage ,
                      title: data[index].title,
                      description: data[index].description,
                      url: data[index].url
                  );
                }),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      } else{
        return const Center(child: CircularProgressIndicator());
      }
    } );
  }
}
