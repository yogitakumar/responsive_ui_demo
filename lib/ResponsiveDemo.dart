import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:responsiveuidemo/HomePage.dart';

class ResponsiveDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Responsive Flutter Demo"),
        centerTitle: true,
      ),
      //******* OrientationBuilder***********
      body: Container(
        child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) =>
                orientation == Orientation.portrait
                    ? potraitMode()
                    : landscapeMode()),
      ),

//      // ********LayoutBuilder***********
////    body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
////      if (constraints.maxWidth > 600) {
////        return landscapeMode();
////      } else {
////        return potraitMode();
////      }
////    },
////    ),
//
//      // ********MediaQuery***********
////    final screenSize = MediaQuery.of(context).size.width;
////        backgroundColor: Colors.white,
////        body: screenSize > 600 ? landscapeMode() : potraitMode()
//    );
    );
  }
}

//class ResponsiveDemo extends StatefulWidget {
//  @override
//  _ResponsiveDemoState createState() => _ResponsiveDemoState();
//}
//
//class _ResponsiveDemoState extends State<ResponsiveDemo> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.lightBlueAccent,
//      appBar: AppBar(
//        title: Text("Responsive Flutter Demo"),
//        centerTitle: true,
//      ),
//      //******* OrientationBuilder***********
//      body: Container(
//        child: OrientationBuilder(
//            builder: (BuildContext context, Orientation orientation) =>
//                orientation == Orientation.portrait
//                    ? potraitMode()
//                    : landscapeMode()),
//      ),
//
//      // ********LayoutBuilder***********
////    body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
////      if (constraints.maxWidth > 600) {
////        return landscapeMode();
////      } else {
////        return potraitMode();
////      }
////    },
////    ),
//
//      // ********MediaQuery***********
////    final screenSize = MediaQuery.of(context).size.width;
////        backgroundColor: Colors.white,
////        body: screenSize > 600 ? landscapeMode() : potraitMode()
//    );
//  }
//}

Widget landscapeMode() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: imageView()),
        SizedBox(
          width: 10,
        ),
        Expanded(child: textView())
        // Expanded(child: LoginFormValidation())
      ],
    );

Widget potraitMode() => Column(
      children: [
        Expanded(child: imageView()),
        Expanded(child: textView())
//Expanded(child: LoginFormValidation())
      ],
    );

Widget imageView() =>
    Image.network('https://miro.medium.com/max/1400/0*vowtRZE_wvyVA7CB');

Widget textView() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Center(
            child: Text("Flutter",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
        SizedBox(
          height: 5,
        ),
        Text(
          '''Flutter is an open-source UI software development kit created by Google. 
It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, 
Google Fuchsia, and the web from a single codebase.
  
First described in 2015,Flutter was released in May 2017.
  
Features:
   1. Hot Reload
   2. Cross-Platform Development
   3. Widget Library
   4. Native Performance
   5. Open-source''',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    ),
  );
}

class LoginFormValidation extends StatefulWidget {
  @override
  _LoginFormValidationState createState() => _LoginFormValidationState();
}

class _LoginFormValidationState extends State<LoginFormValidation> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              /* Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('asset/images/flutter-logo.png')),
                ),
              ),*/
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email id"),
                    ])),
              ),
              /* Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                          "Password should not be greater than 15 characters")
                    ])
                  //validatePassword,        //Function to check validation
                ),
              ),*/
              /* FlatButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text('New User? Create Account')*/
            ],
          ),
        ),
      ),
    );
  }
}
