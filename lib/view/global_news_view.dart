import 'package:flutter/material.dart';

import '../api/news_api.dart';
import '../model/news_article_model.dart';
import '../widget/headline_card.dart';

class GlobalNewsView extends StatefulWidget {
  const GlobalNewsView({Key? key }) : super(key: key);

  @override
  State<GlobalNewsView> createState() => _GlobalNewsViewState();
}

class _GlobalNewsViewState extends State<GlobalNewsView> {
  late Future<List<NewsArticleModel>> newsArticles;

  @override
  void initState() {
    super.initState();
    NewsApi newsApi = NewsApi();
    newsArticles = newsApi.getGlobalNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<NewsArticleModel>>(
        future: newsArticles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsArticleModel>? data = snapshot.data;

            return SingleChildScrollView(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  itemCount: data!.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return HeadlineCard(
                        imageUrl: data[index].urlToImage,
                        title: data[index].title,
                        description: data[index].description,
                        url: data[index].url
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
