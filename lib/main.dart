import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedValueGender, selectedValueModule, selectedValueOutput;
  final dropdownStateGender = GlobalKey<FormFieldState>();
  final dropdownStateModule = GlobalKey<FormFieldState>();
  final dropdownStateOutput = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          width: 800,
          height: 600,
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.symmetric(vertical: 100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Synthea Patient Generator',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          labelText: "Population Size",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Flexible(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(labelText: "Gender"),
                        key: dropdownStateGender,
                        value: selectedValueGender,
                        items: ['Male', 'Female'].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValueGender = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          labelText: "Min Age",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          labelText: "Max Age",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Location",
                    hintText: "Enter the State and City",
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Flexible(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(labelText: "Module"),
                        key: dropdownStateModule,
                        value: selectedValueModule,
                        items: [
                          'Allergies',
                          'Atopy',
                          'Breast Cancer',
                          'Covid19',
                          'Sore Throat'
                        ].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValueModule = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Flexible(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(labelText: "Output Format"),
                        key: dropdownStateOutput,
                        value: selectedValueOutput,
                        items: [
                          'CSV',
                          'FHIR',
                          'CCDA',
                        ].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValueOutput = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: OutlinedButton(
                  child: Text('Generate'),
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.orange,
                    textStyle: TextStyle(fontSize: 20),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
