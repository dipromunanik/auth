import 'dart:io';

import 'package:authentication_api_using/model/login_model.dart';
import 'package:authentication_api_using/model/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string_generator/random_string_generator.dart';
import 'package:http/http.dart' as http;

import '../local_database/db_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool loader = false;
  LoginModel? loginModel;
  String? registerBy;
  LoginModel? loginData;



  var generator = RandomStringGenerator(
    hasAlpha: true,

    alphaCase: AlphaCase.LOWERCASE_ONLY,
    hasDigits: true,
    hasSymbols: false,
    fixedLength: 5,

    mustHaveAtLeastOneOfEach: true,
  );

  String device_id = "123456";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('LoginPage'),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'Email Name';
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                    contentPadding:const EdgeInsets.all(20.0),
                    hintText: 'Email',
                    suffixStyle:const TextStyle(
                        color: Colors.red
                    ),
                    focusColor:const Color(0xff79AE09),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color(0xff79AE09),
                        ),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'Password';
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                    contentPadding:const EdgeInsets.all(20.0),
                    hintText: 'Password',
                    suffixStyle:const TextStyle(
                        color: Colors.red
                    ),
                    focusColor:const Color(0xff79AE09),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color(0xff79AE09),
                        ),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: (){
                  setState(() {
                    loader = true;
                  });
                  if(key.currentState!.validate()) {
                    login();
                  }
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:const Center(child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> login() async{

    device_id =generator.generate();
    print('DDD${device_id}');

    setState(() {
      loader = true;
    });

    Map<String,dynamic> body = {

      "email":"${emailController.text}",
      "password":"${passwordController.text}",
      "device_id": "${device_id}"
    };

    try{
      final uri = Uri.https('https://universalfood.etrackersolution.com/api/frontend/login?email=$emailController&password=$passwordController$device_id',body.toString());

      final response = await http.get(uri,headers: {
        HttpHeaders.contentTypeHeader:'application/json'});


      loginData = loginModelFromJson(response.body);

      if(response.statusCode==200){
          MyPrefs.setToken("${loginData!.data!.apiToken.toString()}&&${device_id}");
          print('__RandomString__${generator.generate()}');
          MyPrefs.setId("${loginData!.data!.customerInfo!.id}");
          Fluttertoast.showToast(
              msg: "Login Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.indigo,
              textColor: Colors.white,
              fontSize: 16.0);

      }else{

      }

    }on SocketException {
      setState(() {
        loader =false;
      });
    }

  }
}
