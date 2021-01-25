// 存放项目后端api接口

import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
//首页参数
Future getHomePageImage() async{
  try{
    Response response;
    Dio dio = new Dio();
    response = await dio.get('http://10.103.227.17:8881/test');
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }


}