import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  final firstnameEditingController = new TextEditingController();
  final lastnameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passEditingController = new TextEditingController();
  final confirmPassEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstnameEditingController,
      keyboardType: TextInputType.name,
      //validator: () {},
      onSaved: (value) {
        firstnameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      
    );
    final lastNameField = TextFormField(
      autofocus: false,
      controller: lastnameEditingController,
      keyboardType: TextInputType.name,
      //validator: () {},
      onSaved: (value) {
        lastnameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );
    final passField = TextFormField(
      autofocus: false,
      controller: passEditingController,
      obscureText: true,
      //validator: () {},
      onSaved: (value) {
        passEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );
    final confirmPassField = TextFormField(
      autofocus: false,
      controller: confirmPassEditingController,
      obscureText: true,
      //validator: () {},
      onSaved: (value) {
        confirmPassEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );

    final signUpButton = Material(
      elevation: 5,
      color: Colors.greenAccent,
      
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){},
        child: Text("Sign Up",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        ),
        ),
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back, color: Colors.greenAccent,)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  firstNameField,
                  SizedBox(height: 10,),
                  lastNameField,
                  SizedBox(height: 10,),
                  emailField,
                  SizedBox(height: 10,),
                  passField,
                  SizedBox(height: 10,),
                  confirmPassField,
                  SizedBox(height: 20,),
                  signUpButton,
                  SizedBox(height: 10,),
                  
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}