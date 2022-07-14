import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormDemo"),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String? username, password;
  bool autovalidate = false;

  String? validatorUserName(String? value){
    if(value == null || value.isEmpty){
      return 'Username is required.';
    }
    return null;
  }
  String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'Password is required.';
    }
    return null;
  }

  submitRegisterForm(){
    if(registerFormKey.currentState == null)return;
    if(registerFormKey.currentState!.validate()){
        registerFormKey.currentState!.save();
        debugPrint('username: $username');
        debugPrint('password: $password');
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Registering...'))
        );
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "UserName",
            helperText: ""
          ),
          onSaved: (value){
            username = value;
          },
          validator: validatorUserName,
          autovalidateMode: autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: "Password",
              helperText: ""
          ),
          onSaved: (value){
            password = value;
          },
          validator: validatePassword,
          autovalidateMode: autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        ),
        SizedBox(height: 32.0,),
        Container(
          child: ElevatedButton(
            child: Text('Register', style: TextStyle(color: Colors.white)),
            onPressed: submitRegisterForm,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0.0),

              backgroundColor: MaterialStateProperty.all(Colors.blue),

            ),
          ),
        )
      ],
    ));
  }
}
