import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testdemo/service/api.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name'
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Description'
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              var data = {
                "pname": nameController.text,
                "pdescription": descriptionController.text
              };
              Api.addProduct(data);
            }, child: Text('Enter'))
          ],
        ),
      ),
    );
  }
}