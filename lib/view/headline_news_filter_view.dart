import 'package:flutter/material.dart';
import 'package:news_api/view/filter_list_view.dart';
import 'package:news_api/view/headline_news_view.dart';

import '../api/filter_list.dart';

class HeadlineNewsFilterView extends StatefulWidget {
  const HeadlineNewsFilterView({Key? key}) : super(key: key);

  @override
  State<HeadlineNewsFilterView> createState() => _HeadlineNewsFilterViewState();
}

class _HeadlineNewsFilterViewState extends State<HeadlineNewsFilterView> {
  @override
  Widget build(BuildContext context) {
    String selectedCategory = categoryList.first;
    List<String> countryList = countryMap.keys.toList();
    String selectedCountry = countryList.first;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'top',
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
            ),
            Text(
              'news',
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
            )
          ],
        ),
        elevation: 0.0,
        actions: [
          Opacity(
            opacity: 0,
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Filter headline news',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'By category (default: general)',
                  style: TextStyle(fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    itemCount: categoryList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.5),
                        child: Ink(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {
                                selectedCategory = categoryList[index] ?? "general";
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        FilterListView(filterType: Filter.category, selectedValue: selectedCategory)));
                              },
                              title: Text(
                                categoryList[index],
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'By country (default: USA)',
                  style: TextStyle(fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    itemCount: countryList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.5),
                        child: Ink(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {
                                selectedCountry = countryMap[countryList[index]] ?? "us";
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                    FilterListView(filterType: Filter.country, selectedValue: selectedCountry)));
                              },
                              title: Text(
                                countryList[index],
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ]),
        ),
      ),
    );
  }
}
