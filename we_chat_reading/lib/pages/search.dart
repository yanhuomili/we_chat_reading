import 'dart:async';

import 'package:flutter/material.dart';
import 'package:we_chat_reading/routers/application.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
// class Search extends StatelessWidget {
//   final String goodsId;
//   const Search(this.goodsId, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('搜索页面'),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Center(child: Text('搜索页面'),),
//             Text('商品ID: $goodsId')

//           ],
//         ),
//       ),
//     );
//   }
// }

class Search extends StatefulWidget {
  final String goodsId;
  Search(this.goodsId, {Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState(goodsId);
}

class _SearchState extends State<Search> {
  final String goodsId;
  _SearchState(this.goodsId);

  int page = 1;
  List list = [1,2,3,4,5,6,7,8,9];
  List<Color> colorList = [
    Colors.blue,
    Colors.pink,
    Colors.grey,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.black45,
  ];
  ScrollController _scrollController = ScrollController();
  EasyRefreshController _easyRefreshController = EasyRefreshController();


  @override
  void initState(){
    // _scrollController.addListener((){
    //   print(_scrollController);
    //   _overBottom(_scrollController);
    // });
  }
  
  /* flutter监听ListView滚动到底部 */
  // _overBottom(_scrollController){
  //   if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
  //     print('到达底部');
  //     _getMoreData();
  //   }
  // }
  _getMoreData(){
    List newList = [];
    for(int i = 0; i < 10; i++){
      newList.add(i);
    }
    setState(() {
      list.addAll(newList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索页面'),
      ),
      body: Container(
       child: EasyRefresh(
          controller: _easyRefreshController,
          enableControlFinishRefresh: true,
          enableControlFinishLoad: true,
          header: BallPulseHeader(),
          footer: BezierBounceFooter(),
          onRefresh: () async{
            Timer(Duration(seconds:2), (){
              _easyRefreshController.finishRefresh(success: true);
              print('刷新');
            });
          },
          onLoad: () async{
            Timer(Duration(seconds:2), (){
              print('加载更多');
              if(page >= 15){
                _easyRefreshController.finishLoad(success: true, noMore: true);
              }else{
                _getMoreData();
                _easyRefreshController.finishLoad(success: true, noMore: false);
                page += 1;
                print(page);
              }
              
            });
         },
         child: ListView.builder(
          controller: _scrollController,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.only(top: 5,bottom: 5),
                  color: colorList[index % 6],
                  child: Text('这是第 ${index+1} 行数据'),
                )
              ],
            );
          },
        ),
       )
      ),
    );
  }
}
