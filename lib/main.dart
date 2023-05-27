import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Body Mass Index',
      home : HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=> _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen>{
  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  double? _bmi;

  String _message = " Please enter your height and weight";
  void _calculate(){

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: SizedBox(
          width: 320,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(padding: EdgeInsets.all(20),
            child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField( keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: "Height (m)"),
        controller: _heightController,
      ),
      TextField(
        keyboardType:TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: 'Weight (kg)',
          ) ,
        controller: _weightController,
      ),

      ElevatedButton(onPressed: _calculate, child: const Text('Calculate'),),
      const SizedBox(height: 30,),

      Text(
        _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
        style: const TextStyle(fontSize: 50),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 20,
      ),

      Text(
        _message,
        textAlign: TextAlign.center,
      )

    ],

            )
          )
        ),
      )
    ) );
  }
}