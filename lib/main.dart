// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:developer' as devLog;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  String bmi = '';
  String msg = '';
  var bgColor = Colors.purple.shade300;

  void calculateBMI() {
    double wt = double.parse(wtController.text);
    double ft = double.parse(ftController.text.toString());
    double inch = double.parse(inController.text.toString());
    if (wt == 0 && ft == 0 && inch == 0) {
      // PRINT EMPTY
      bmi = "Please Enter all fields";
    } else {
      double heightMeters = ((ft * 12) + inch) * (0.0254); // convert to meters
      var result = wt / (heightMeters * heightMeters);
      if (result > 25) {
        msg = "You are Overweight";
        bgColor = Colors.orange.shade200;
      } else if (result < 18) {
        msg = "You are Underweight";
        bgColor = Colors.red.shade200;
      } else {
        msg = "You are Healthy";
        bgColor = Colors.green.shade200;
      }
      setState(() {
        bmi = result.toStringAsFixed(2).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BMI Calculator"),
      ),
      body: Center(
        child: Container(
            color: bgColor,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Enter your Weight(in kgs)'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your height(in feet)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your height (innch)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: calculateBMI, child: Text('Calculate BMI')),
                SizedBox(
                  height: 16,
                ),
                Text('${msg}\n' 'Your BMI is ${bmi}'),
              ],
            )),
      ),
    );
  }
}
