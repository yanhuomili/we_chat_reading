import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

class Routes {
  static String root = '/';
  static String search = '/search';
  static String bookDetail = '/bookDetail';


  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('找不到路由');
      }
    );

    router.define(search,handler:searchHandler);
    router.define(bookDetail,handler:bookDetailHandler);
  }
}
