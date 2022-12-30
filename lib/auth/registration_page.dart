import 'package:authentication_api_using/auth/login_page.dart';
import 'package:authentication_api_using/home_screen.dart';
import 'package:authentication_api_using/model/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:random_string_generator/random_string_generator.dart';


class ReitrationPage extends StatefulWidget {
  const ReitrationPage({Key? key}) : super(key: key);

  @override
  State<ReitrationPage> createState() => _ReitrationPageState();
}

class _ReitrationPageState extends State<ReitrationPage> {

  bool loader = false;
  RegisterModel? registerModel;
  String? registerBy;

  var generator = RandomStringGenerator(
    hasAlpha: true,

    alphaCase: AlphaCase.LOWERCASE_ONLY,
    hasDigits: true,
    hasSymbols: false,
    fixedLength: 5,

    mustHaveAtLeastOneOfEach: true,
  );

  String device_id = "123456";

  final key = GlobalKey<FormState>();
  TextEditingController fullController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController Controller = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Registration'),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'First Name';
                    }
                  },
                  controller:fullController ,
                  decoration: InputDecoration(
                      contentPadding:const EdgeInsets.all(20.0),
                      hintText: 'First Name',
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
                      return 'Last Name';
                    }
                  },
                  controller: lastController,

                  decoration: InputDecoration(
                      contentPadding:const EdgeInsets.all(20.0),
                      hintText: 'Last Name',
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
                      return 'Phone Number';
                    }
                  },
                  controller: phoneController,
                  decoration: InputDecoration(
                      contentPadding:const EdgeInsets.all(20.0),
                      hintText: 'Phone Number',
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
                      return 'Gender';
                    }
                  },
                  controller: genderController,
                  decoration: InputDecoration(
                      contentPadding:const EdgeInsets.all(20.0),
                      hintText: 'Gender',
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
                      return 'Address';
                    }
                  },
                  controller: addressController,
                  decoration: InputDecoration(
                      contentPadding:const EdgeInsets.all(20.0),
                      hintText: 'Address',
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
                      return 'New Password';
                    }
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                      contentPadding:const EdgeInsets.all(20.0),
                      hintText: 'New Password',
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
                const SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    setState(() {
                      loader = true;
                    });
                   if(key.currentState!.validate()) {
                     register();
                   }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:const Center(child: Text('Registration',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<RegisterModel?> register() async{

    device_id =generator.generate();
    print("Device.....$device_id");

    setState(() {
      loader = true;
    });



    if(emailController.text.contains("@")){
      registerBy ="email";
    }else{
      registerBy = "phone";
    }

    Map<String,dynamic> body = {

      "first_name":"${fullController.text}",
      "last_name":"${lastController.text}",
      "email":"${emailController.text}",
      "phone":"${phoneController.text}",
      "gender":"${phoneController.text}",
      "address":"${addressController.text}",
      "password":"${passwordController.text}",
      "device_id": "${device_id}"
    };

    var response = await http.post(Uri.parse("https://universalfood.etrackersolution.com/api/frontend/customer/registration"),

      body: body,
      headers: {
        "Accept" : "application/json"
      }
    );
    registerModel =registerModelFromJson(response.body);


    if(response.statusCode ==200){

        print(registerModel);
        Fluttertoast.showToast(
            msg: "Registration Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        setState(() {
          loader= false;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        print("response__${response.body}");



    }
    else{
      setState(() {
        loader = false;
      });
    }
    return registerModel;
  }
}
