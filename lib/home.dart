import 'package:flutter/material.dart';

import 'gym.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // the controller for the text field associated with "height"
  final _heightController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  double? _bmi;
  // the message at the beginning
  String _message = 'Please enter your height and weight';
  
  late bool isHEmpty=false;
  late bool isWEmpty=false;

  // This function is triggered when the user pressess the "Calculate" button
  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }
    print(weight);
    print(height);
    setState(() {
      _bmi = weight / (height * height);
      print(_bmi);
      if (_bmi! < 18.5) {
        _message = "Underweight";
      } else if (_bmi! < 25) {
        _message = 'Normal';
      } else if (_bmi! < 30) {
        _message = 'Overweight';
      } else {
        _message = 'Obese';
      }
    });
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 227, 227),
        body: Center(
          child: SizedBox(
            width: 320,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _bmi == null ? 'BMI' : _bmi!.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _message,
                      textAlign: TextAlign.center,
                       ),
                       const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration:
                          const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Height (m)'),
                      controller: _heightController,
                       onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          isHEmpty = true;
                        } else {
                          isHEmpty = false;
                        }
                      });
                      }
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight (kg)',
                         ),
                      controller: _weightController,
                      onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          isWEmpty = true;
                        } else {
                          isWEmpty = false;
                        }
                      });
                      }
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: _calculate,
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (isWEmpty && isHEmpty) {
                          return Colors.orange;
                        }
                        return Colors.grey;
                      }),
                    ),
                      child: const Text('Calculate'),
                    ),
                     TextButton(
                      onPressed: () { _navigateToNextScreen(context); }, 
          
                      child: Text('View gyms'),
                    ),
                    //  InkWell(
                    //    child: Container(
                    //      child:Text("View Gyms")
                    // ),
                    //  ),

                    const SizedBox(
                      height: 30,
                    ),
                    
                    const SizedBox(
                      height: 20,
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Gym(title: 'gym',)));
  }
}


