import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:motangapp/service/service_api.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        // 异步请求再渲染wiget
        child: new FutureBuilder(
          future: getHomePageImage(),
          builder: (context,snapshot){
            if(snapshot.hasData){
             var data = json.decode(snapshot.data.toString());
             // 将后端数据强转成list
             List<Map> swiper = (data as List).cast();
             return Column(
               children: <Widget>[
                 new TopNavigator(navigatorList: swiper),
                 new swiperTool(swiperDataList: swiper)
               ],
             );
            }else{
              return new Center(
              child: new Text("数据加载中。。。。。")
              );
            }
          },
        ),
      ),
    );
  }
}


class swiperTool extends StatelessWidget {

  final List swiperDataList;

  swiperTool({Key key,this.swiperDataList}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: new Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDataList[index]['image']}",fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        // 图片加点
        pagination: new SwiperPagination(),
        // 自动播放
        autoplay: true,
      ),

    );
  }
}


class TopNavigator extends StatelessWidget {

  final List navigatorList;

  Widget _gridView(BuildContext context,data){
    return InkWell(
      onTap: (){
      },
      child:  new Column(
        children: <Widget>[
//          Image.network(data['image'],height: ScreenUtil().setWidth(95)),
          new Text(data['name'])
        ],
      ),
    );
  }

  TopNavigator({Key key,this.navigatorList}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.all(6.0),
      child: new GridView.count(
           crossAxisCount: 5,
           padding: EdgeInsets.all(5.0),
           children: navigatorList.map((data){
             return _gridView(context, data);
            }).toList(),
    )
    );
  }
}
