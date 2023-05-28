
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
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

  //   if (height == null  || weight == null) {
  //     setState(() {
  //       _message = "Your height and weigh must be positive numbers";
  //     }
  //
  //
  //     );
  //     return;
  //
  //
  // }
    if (height == null || weight == null){

        var snackBar = const SnackBar(content: Text('Height or Weight cannot be Empty or Negative'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;

    }
setState(() {
  _bmi = weight / (height * height);
  if (_bmi! < 18.5) {
    _message = "You are underweight";
  } else if (_bmi! < 25) {
    _message = 'You body is fine';
  } else if (_bmi! < 30) {
    _message = 'You are overweight';
  } else {
    _message = 'You are obese';
  }
});

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
            child: Padding(padding: const EdgeInsets.all(20),
            child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField( keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(labelText: "Height (m)"),
        controller: _heightController,
      ),
      TextField(
        keyboardType:const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Weight (kg)',
          ) ,
        controller: _weightController,
      ),

      ElevatedButton(onPressed: _calculate, child: const Text('Calculate'),),
      const SizedBox(height: 30,),

      Text(
        _bmi == null ? '' : _bmi!.toStringAsFixed(2),
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