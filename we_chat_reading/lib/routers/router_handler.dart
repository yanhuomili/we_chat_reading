import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:we_chat_reading/pages/book_detail.dart';
import '../pages/search.dart';

Handler searchHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String goodsId = params['id'].first;
    print('search page goodsId is ${goodsId}');
    return Search(goodsId);
     
  }
);

Handler bookDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return BookDetail();
  }
);
