import 'package:flutter/material.dart';

import '../api/filter_list.dart';

class FilterList extends StatefulWidget {
  final String filterOption;
  const FilterList({Key? key, required this.filterOption}) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  late List<String> selectionList;
  late String selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.filterOption == Filter.category.name){
      selectionList = categoryList;
    }
    if(widget.filterOption == Filter.language.name){
      selectionList = languageMap.values.toList();
    }
    if(widget.filterOption == Filter.country.name){
      selectionList = countryMap.keys.toList();
    }
    if(widget.filterOption == Filter.sortBy.name){
      selectionList = sortByMap.keys.toList();
    }

    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        itemCount: selectionList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Ink(
            color: Colors.red,
            child: ListTile(
              onTap: (){
                selectedValue = selectionList[index];
              },
              title: Text(selectionList[index],
                style: const TextStyle(
                  backgroundColor: Colors.black54 ,
                  fontSize: 20.0,
                  color: Colors.white
                ),),
            ),
          );
        });
  }
}
