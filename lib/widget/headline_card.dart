import 'package:flutter/material.dart';
import 'package:news_api/view/news_article_view.dart';

class HeadlineCard extends StatelessWidget {
  final String? imageUrl, title, description, url;
  const HeadlineCard({Key? key, required this.imageUrl, required this.title, required this.description,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:
        (context) => NewsArticleView(articleUrl: url ?? '')));
      },
      child: Column(
        children: [
          Image.network(
            imageUrl ?? '',
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            fit: BoxFit.cover,),
          Text(title ?? '', style: const TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          )),
          const SizedBox(height: 5.0),
          Text(description ?? ''),
          const SizedBox(height: 20.0)

        ],
      ),
    );
  }
}
