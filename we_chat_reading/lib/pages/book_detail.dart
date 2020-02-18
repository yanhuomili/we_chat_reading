import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_chat_reading/routers/application.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:dio/dio.dart';
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

class BookDetail extends StatefulWidget {
  BookDetail({Key key}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  int page = 1;
  ScrollController _scrollController = ScrollController();
  EasyRefreshController _easyRefreshController = EasyRefreshController();

  List addressList = [
    {'name': '演示用', 
      'url': 'nntp://tjkasviic.az/chptjml', 
      'email': 'i.ubvu@ppylwpwc.m★★★★★', 
      'number': '10', 
      'address': '四川省 达州市 大竹县', 
      'string': '★★★★★★★', 
      'boolean': true, 
    },
    {'name': '演示用', 
      'url': 'nntp://tjkasviic.az/chptjml', 
      'email': 'i.ubvu@ppylwpwc.m★★★★★', 
      'number': '10', 
      'address': '四川省 达州市 大竹县', 
      'string': '★★★★★★★', 
      'boolean': true, 
    },
    {'name': '演示用', 
      'url': 'nntp://tjkasviic.az/chptjml', 
      'email': 'i.ubvu@ppylwpwc.m★★★★★', 
      'number': '10', 
      'address': '四川省 达州市 大竹县', 
      'string': '★★★★★★★', 
      'boolean': true, 
    },
    {'name': '演示用', 
      'url': 'nntp://tjkasviic.az/chptjml', 
      'email': 'i.ubvu@ppylwpwc.m★★★★★', 
      'number': '10', 
      'address': '四川省 达州市 大竹县四川省 达州市 大竹县四川省 达州市 大竹县四川省 达州市 大竹县', 
      'string': '★★★★★★★', 
      'boolean': true, 
    },
    {'name': '演示用', 
      'url': 'nntp://tjkasviic.az/chptjml', 
      'email': 'i.ubvu@ppylwpwc.m★★★★★', 
      'number': '10', 
      'address': '四川省 达州市 大竹县', 
      'string': '★★★★★★★', 
      'boolean': true, 
    },
    {'name': '演示用', 
      'url': 'nntp://tjkasviic.az/chptjml', 
      'email': 'i.ubvu@ppylwpwc.m★★★★★', 
      'number': '10', 
      'address': '四川省 达州市 大竹县', 
      'string': '★★★★★★★', 
      'boolean': true, 
    },
    {'name': '演示用', 
      'url': 'nntp://tjkasviic.az/chptjml', 
      'email': 'i.ubvu@ppylwpwc.m★★★★★', 
      'number': '10', 
      'address': '四川省 达州市 大竹县四川省 达州市 大竹县四川省 达州市 大竹县四川省 达州市 大竹县', 
      'string': '★★★★★★★', 
      'boolean': true, 
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  void getMoredata() async{
    if(page >= 6){
      _easyRefreshController.finishLoad(success: true, noMore: true);
    }else{
      setState(() {
          addressList.addAll(addressList.sublist(0,4));
      });
      _easyRefreshController.finishLoad(success: true, noMore: false);
      // try {
      //   Response response;
      //   response = await Dio().get(
      //     'https://www.easy-mock.com/mock/5d64f70308c6db311bf3e2f4/example/mock'
      //   );
      //   print(response.data);
      //   setState(() {
      //     addressList.addAll(response.data);
      //   });
      //   page ++;
      //   _easyRefreshController.finishLoad(success: true, noMore: false);
      // } catch (e) {
      //   print(e);
      //   setState(() {
      //     addressList.add(addressList);
      //   });
      //   _easyRefreshController.finishLoad(success: true, noMore: false);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书本详情页'),
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
            print('加载更多');
            Timer(Duration(seconds:2), (){
              getMoredata();
            });
         },
         child: ListView.builder(
          controller: _scrollController,
          itemCount: addressList.length,
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: <Widget>[
                _listItem(addressList[index]),
                Container(
                  width: ScreenUtil().setWidth(600),
                  height: ScreenUtil().setHeight(200),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(
                      color: Colors.red,
                      width: 5
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    '测试宽高适配',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(20)
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          },
        ),
       )
      ),
    );
  }
  
  Widget _listItem(addressData){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _itemName(addressData['name']),
          _itemRow(addressData['email'],addressData['address']),
        ],
      ),
    );
  }

  Widget _itemName(name){
    return Container(
        padding:EdgeInsets.only(bottom: 10),
        child: Text(
          name,
        ),
    );
  }

  Widget _itemRow(email, address){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 150,
          child: Text(
            email,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Container(
            child: Text(
              address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }

}
