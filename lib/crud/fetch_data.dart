import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testdemo/model/product_model.dart';
import 'package:testdemo/service/api.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data;
            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.storage),
                  title: Text("${pdata[index].name}"),
                  subtitle: Text("${pdata[index].description}"),
                );
               },);
          }
          
        }),
    );
  }
}