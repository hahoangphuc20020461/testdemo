import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testdemo/model/product_model.dart';

class Api {
  static const baseUrl = "http://192.168.0.103/api/";

  static addProduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}add_product");
    try{
final res = await http.post(url, body: pdata);
    if(res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      print(data);
    } else {
      print('failed to get response');
    }
    } catch(e) {
      print(e.toString());
    }
    
  }

  static getProduct() async {
    List<Product> Products = [];
    var url = Uri.parse("${baseUrl}get_product");
    try{
final res = await http.get(url);
    if(res.statusCode == 200) {
     var data = jsonDecode(res.body);
     data['Products'].forEach((value) => {
      Products.add(Product(name: value['pname'], description: value['pdescription']))
     });
     return Products;

    } else {
     return [];
    }
    } catch(e) {
      print(e.toString());
    }
  }
}