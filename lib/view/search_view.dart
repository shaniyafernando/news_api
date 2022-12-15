import 'package:flutter/material.dart';

import '../api/news_api.dart';
import '../model/news_article_model.dart';
import '../widget/headline_card.dart';

class SearchView extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(
        onPressed: (){
          query = '';
        },
        icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    NewsApi newsArticles = NewsApi();

    return FutureBuilder <List<NewsArticleModel>>(
        future: newsArticles.getNewsBySearchQuery(query),
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
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('Search news'),
            );
          }else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else{
            return const Center(child: CircularProgressIndicator());
          }
        } );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search news'),
    );
  }
}
