import 'package:flutter/material.dart';
import 'package:flutter_todoapp_application/news_app/data/dummy_data.dart';
import 'package:flutter_todoapp_application/news_app/widgets/NewsWidget.dart';

class AllNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsWidget(newsList[index]);
          }),
    );
  }
}
