// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore, unused_element, prefer_const_constructors, unnecessary_new
import 'dart:convert' show utf8;
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ratemyfood/Pages/Model.dart';
import 'package:ratemyfood/Pages/Network.dart';
import 'package:cool_alert/cool_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<phongbanDB> phongbandb = List();
  var childimg = [
    'img/1.jpg',
    'img/2.png',
    'img/3.png',
    'img/1.jpg',
    'img/4.png',
    'img/2.png',
    'img/4.png',
    'img/3.png',
    'img/2.png',
    'img/1.png',
    'img/4.png',
    'img/1.png',
    'img/2.png',
    'img/3.png',
    'img/2.png',
  ];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchProducts().then(
      (dataFromServer) {
        setState(() {
          phongbandb = dataFromServer;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Text(
              'Quản lý nhân viên - Kinh doanh',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: phongbandb.length,
                    itemBuilder: (context, index) {
                      return new Card(
                        color: Colors.greenAccent[500],
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return new AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Card(
                                            child: Image.asset(
                                              '${childimg[index]}',
                                              height: 50,
                                            ),
                                          ),
                                          Text(
                                            'Tên nhân viên : ${phongbandb[index].tennhanvien}',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 17,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                              ),
                                              text:
                                                  'Địa chỉ :${phongbandb[index].diachi}',
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                              ),
                                              text:
                                                  'Chức vụ :${phongbandb[index].chucvu}',
                                            ),
                                          ),
                                          Text(
                                            'Số điện thoại : ${phongbandb[index].sodienthoai}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Text(
                                            'Lương : ${phongbandb[index].luong} VND',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            'Giới tính: ${phongbandb[index].gioitinh}',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            'Tình trạng hôn nhân: ${phongbandb[index].tthonnhan}',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    '${childimg[index]}',
                                    height: 50,
                                  ),
                                  Row(children: [
                                    Container(
                                      width: 350,
                                      child: Text(
                                        '${phongbandb[index].id}. ${phongbandb[index].tennhanvien}',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.create_outlined),
                                      onPressed: () {
                                        setState(() {});
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {});
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {});
                                      },
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
