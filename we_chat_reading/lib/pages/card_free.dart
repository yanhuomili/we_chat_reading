import 'dart:convert';

import 'package:flutter/material.dart';
import 'base_card.dart';
import 'package:dio/dio.dart';

//免费听书馆
class CardFree extends BaseCard{
  @override
  _CardFreeState createState() => _CardFreeState();
}

class _CardFreeState extends BaseCardState{
  Color bottomTitleColor = Colors.grey;
  List newBookListData = [];
  List<Map<String, String>> bookListData = [
    {
      'title':'混沌剑神',
      'cover':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3880341262,3308316348&fm=26&gp=0.jpg',
      'price': '36.6'
    },
    {
      'title':'九阳帝尊',
      'cover':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3880341262,3308316348&fm=26&gp=0.jpg',
      'price': '18.2'
    },
    {
      'title':'九仙图',
      'cover':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3880341262,3308316348&fm=26&gp=0.jpg',
      'price': '26.8'
    },
    {
      'title':'凡人修仙传',
      'cover':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3880341262,3308316348&fm=26&gp=0.jpg',
      'price': '22.9'
    },{
      'title':'诛仙',
      'cover':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3880341262,3308316348&fm=26&gp=0.jpg',
      'price': '40.5'
    },
    {
      'title':'斗罗大陆:龙王传说',
      'cover':'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3880341262,3308316348&fm=26&gp=0.jpg',
      'price': '12.6'
    },
  ];

  var defaultUrl = 'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3880341262,3308316348&fm=26&gp=0.jpg';

  @override
  void initState() {
    subTitleColor = Colors.purple; // 重写subTitleColor
    super.initState();
  }

  @override
  // 重写topTitle
  topTitle(String title){ 
    return super.topTitle('免费听书馆');
  }

  @override
  Widget subTitle(String title){
    return super.subTitle('第 108 期');
  }

  @override
  Widget bottomContent() {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: _bookList()
            ),
            Expanded(
              child: _bookList1(),
            ),
            _bottomButton()
          ],
        ),
      ),
    );
  }

  Widget bottomTitle(String title){
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        color: bottomTitleColor
      ),
    );
  }

  Widget _bookList(){
    return GridView.count(
      crossAxisCount: 3, 
      mainAxisSpacing: 8, // 垂直间距
      crossAxisSpacing: 15, // 水平间距
      childAspectRatio: 0.46, // 长宽比
      padding: EdgeInsets.only(left: 20,right: 20),
      children: bookListData.map((item){
        return _item(item);
      }).toList()
    );
  }

  Widget _bookList1(){
    return GridView.count(
      crossAxisCount: 3, 
      mainAxisSpacing: 8, // 垂直间距
      crossAxisSpacing: 15, // 水平间距
      childAspectRatio: 0.46, // 长宽比
      padding: EdgeInsets.only(left: 20,right: 20),
      children: newBookListData.map((item){
        return _item1(item);
      }).toList()
    );
  }


  Widget _bottomButton(){
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: RaisedButton(
          onPressed: (){
            print(bookListData);
            print('点击');
            getHttp();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.only(top: 5,bottom: 5),
          color: Colors.blue,
          child: Text(
            '免费领取',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      )
    );
  }

  void getHttp() async{
    try{
      Response response;
      response = await Dio().get(
        // 'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=性感小姐姐'
        // 'https://www.jianshu.com/shakespeare/v2/notes/48430725fb8d/audio'
        'https://www.jianshu.com/shakespeare/notes/48430725fb8d/recommendations'
      );

      setState(() {
        newBookListData.addAll(response.data);
        print(newBookListData);
      });
      return;
    }catch(e){
      return print(e);
    }
  }

  Widget _item(Map<String,String> item){
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image.network(item['cover'],fit: BoxFit.cover,),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: Text(
                    '原价${item['price']}',
                    style: TextStyle(
                      color: Colors.white,fontSize: 10
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              item['title'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _item1(Map item){
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image.network(item['list_image_url'] =='' ? defaultUrl : item['list_image_url'],fit: BoxFit.cover,width: 80,height: 100,),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: Text(
                    '原价${item['views_count']}',
                    style: TextStyle(
                      color: Colors.white,fontSize: 10
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              item['title'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

}