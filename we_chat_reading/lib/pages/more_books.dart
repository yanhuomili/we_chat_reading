import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  BooksPage({Key key}) : super(key: key);

  final list = [
    '免费书本1',
    '免费书本2',
    '免费书本3',
    '免费书本4',
    '免费书本5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('免费好书'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(
            child: Text('免费书本1'),
            onPressed: (){
              Navigator.pop(context,list);
            },
          ),
          RaisedButton(
            child: Text('免费书本2'),
            onPressed: (){
              Navigator.pop(context,list);
            },
          ),
          RaisedButton(
            child: Text('免费书本3'),
            onPressed: (){
              Navigator.pop(context,list);
            },
          ),
        ],),
      ),
    );
  }
}