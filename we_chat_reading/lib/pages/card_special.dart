import 'package:flutter/material.dart';
import 'base_card.dart';
import 'package:dio/dio.dart';

//免费听书馆
class CardSpecial extends BaseCard{
  @override
  _CardSpecialState createState() => _CardSpecialState();
}

class _CardSpecialState extends BaseCardState{
  @override
  void initState() {
    subTitleColor = Colors.purple; // 重写subTitleColor
    bottomTitleColor = Colors.blue; // 重写底部文字颜色
    // getHttp();
    super.initState();
  }

  @override
  topContent() {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: 150,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xfffffcf7),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,
                  offset: Offset(
                    0, // 水平偏移量 
                    10, // 垂直偏移量
                  )
                )
              ]
            ),
            child: Image.network('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=184920421,3115871147&fm=26&gp=0.jpg'),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 15, 15, 10),
          decoration: BoxDecoration(
            color: Color(0xfff7f3ea)
          ),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '长安十二时辰...',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      '马伯庸',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff7d725c)
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white54,
                      Colors.black12
                    ]
                  ),
                ),
                child: Text(
                  '分享免费领取',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 13
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // void getHttp() async{
  //   try{
  //     Response response;
  //     response = await Dio().get(
  //       'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=性感小姐姐'
  //     );
  //     return print(response);
  //   }catch(e){
  //     return print(e);
  //   }
  // }

  @override
  bottomContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3314252932,127218969&fm=26&gp=0.jpg',
                  width: 26,
                  height: 26,
                ),
                Text('揭露历史真相')
              ],
            ),
          ),
          bottomTitle('更多免费好书领不停 >')
        ],
      ),
    );
  }



}