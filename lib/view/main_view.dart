import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_api/view/global_news_filter_view.dart';
import 'package:news_api/view/global_news_view.dart';
import 'package:news_api/view/headline_news_filter_view.dart';
import 'package:news_api/view/search_view.dart';

import 'headline_news_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  Widget displayFilterView(){
    if(_selectedIndex == 0){
      return const HeadlineNewsFilterView();
    }
    return const GlobalNewsFilterView();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HeadlineNewsView(), GlobalNewsView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  signOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: signOut,
            icon: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
            )),
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
        actions: [
          IconButton(
              onPressed: (){
                showSearch(context: context, delegate: SearchView());
              },
              icon: const Icon(Icons.search)),
          IconButton(
            icon: const Icon(Icons.filter),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => displayFilterView()));
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_headline),
            label: 'Headline News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Global News',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
      body:  _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
