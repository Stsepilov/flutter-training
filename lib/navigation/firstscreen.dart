import 'package:flutter/material.dart';
import 'package:untitled/navigation/secondscreen.dart';
import 'package:untitled/navigation/styles.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String text = 'Some Text';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(32.0), child: Text(text, style: Theme.of(context).textTheme.displaySmall)),
            ElevatedButton(
              child: const Text('Move to Second Screen'),
              style: raisedButtonStyle,
              onPressed: (){
                _returnDataFromSecondScreen(context);
              }
            )
          ]
        )
      ),
    );
  }

  void _returnDataFromSecondScreen(BuildContext context) async{
    Route route = MaterialPageRoute(builder: (context) => const SecondScreen());
    final result = await Navigator.push(context, route);
    setState(() {
      text = result;
    });
  }
}
