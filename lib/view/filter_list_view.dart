import 'package:flutter/material.dart';

import '../api/filter_list.dart';
import '../api/news_api.dart';
import '../model/news_article_model.dart';
import '../widget/headline_card.dart';

class FilterListView extends StatefulWidget {
  final Filter filterType;
  final String selectedValue;
  const FilterListView({Key? key, required this.filterType, required this.selectedValue}) : super(key: key);

  @override
  State<FilterListView> createState() => _FilterListViewState();
}

class _FilterListViewState extends State<FilterListView> {
  late Future<List<NewsArticleModel>> newsArticles;

  @override
  void initState() {
    super.initState();
    NewsApi newsApi = NewsApi();
    if(widget.filterType == Filter.country){
      newsArticles = newsApi.getHeadlineNewsFilteredByCountry(widget.selectedValue);
    }
    if(widget.filterType == Filter.category){
      newsArticles = newsApi.getHeadlineNewsFilteredByCategory(widget.selectedValue);
    }
    if(widget.filterType == Filter.language){
      newsArticles = newsApi.getGlobalNewsFilteredByLanguage(widget.selectedValue);
    }
    if(widget.filterType == Filter.sortBy) {
      newsArticles = newsApi.getGlobalNewsFilteredBySortBy(widget.selectedValue);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('top', style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white
            ),),
            Text('news', style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black
            ),)
          ],),
        elevation: 0.0,
        actions: const [
          Opacity(opacity: 0,child: Icon(Icons.add),)
        ],
      ),
      body: FutureBuilder <List<NewsArticleModel>>(
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
          } ),
    );
  }
}
