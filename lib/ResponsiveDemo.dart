import 'package:flutter/material.dart';

class ResponsiveDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Responsive Flutter Demo"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return horizontalLayout();
          } else {
            return verticalLayout();
          }
        },
      ),
    );
  }
}

Widget horizontalLayout() => Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(child: imageView()),
        //Expanded(child:textView()),
        Expanded(child: LoginFormValidation())
      ],
    );

Widget verticalLayout() => Flex(
      direction: Axis.vertical,
      children: [
        Expanded(child: imageView()),
        Flexible(
            child: FractionallySizedBox(
          heightFactor: 0.1,
        )),
        //Expanded(child:textView()),
        Expanded(child: LoginFormValidation())
      ],
    );

Widget narrowLayout() => Column(
      children: [
        Expanded(child: imageView()),
        //Expanded(child: textView()),
        Expanded(child: LoginFormValidation())
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              key: ValueKey(1),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  hintText: 'Enter first name'),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              key: ValueKey(2),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                  hintText: 'Enter last name'),
            )
          ],
        ),
      ),
    );
  }
}
