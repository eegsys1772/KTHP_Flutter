// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore, unused_element, prefer_const_constructors, unnecessary_new
import 'dart:convert' show utf8;
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ratemyfood/Pages/Model.dart';
import 'package:ratemyfood/Pages/Network.dart';
import 'package:cool_alert/cool_alert.dart';

class Subject extends StatefulWidget {
  const Subject({Key key}) : super(key: key);

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  List<phongbanDB> phongbandb = List();
  var phongban = [
    'Phòng ban : Kinh doanh',
    'Phòng ban : Maketing',
    'Phòng ban : Tài vụ',
    'Phòng ban : Chăm sóc khách hàng',
    'Phòng ban : Lễ tân',
    'Phòng ban : Bảo vệ',

  ];
  var maphongban = [
    'Mã phòng ban : KD01',
    'Mã phòng ban : MKT011',
    'Mã phòng ban : TV0212',
    'Mã phòng ban : CSKH1707',
    'Mã phòng ban : LT01234',
    'Mã phòng ban : BV111',
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
          backgroundColor: Colors.lightBlue[600],
          title: Center(
            child: Text(
              'Quản lý phòng ban và nhân viên',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.yellowAccent[400],
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: phongban.length,
                    itemBuilder: (context, index) {
                      return new Card(
                        color: Colors.lightGreen[50],
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/MainPage');
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${phongban[index]}',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '${maphongban[index]}',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(children: [
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
