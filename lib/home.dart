import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testdemo/crud/create_data.dart';
import 'package:testdemo/crud/fetch_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber)
              ),
              onPressed: (){_pickImageFromCamera();},
              child: Text('img from cam')),
              SizedBox(height: 20,),
              ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber)
              ),
              onPressed: (){_pickImageFromGallery();},
              child: Text('img from gallery')),
        
              Text('data'),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateData()));
              }, child: Text("Create data")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FetchData()));
              }, child: Text("Read data")),
              ElevatedButton(onPressed: (){}, child: Text("update data")),
              ElevatedButton(onPressed: (){}, child: Text("delete data")),
              SizedBox(height: 20,),
              _selectedImage != null ? Image.file(_selectedImage!) : Text('selec img'),
        
            ],
          ),
          ),
          
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage == null) return;
    setState(() {
      _selectedImage = File(returnImage!.path);
    });
  }
  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnImage == null) return;
    setState(() {
      _selectedImage = File(returnImage!.path);
    });
  }
}