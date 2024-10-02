import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: FirstPage(),
    onUnknownRoute: (settings){
      return MaterialPageRoute(
        builder: (context) => const FirstPage(),
      );
    },
    onGenerateRoute: (settings) {
      if (settings.name == '/second') {
        User user = settings.arguments as User;
        return MaterialPageRoute(builder: (context) => SecondPage(user: user));
      }
      return null;
    }
  ));
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        centerTitle: true,
      ),
      body:
        Center(
          child: ElevatedButton(
            child: Text('Go to Second Page'),
            onPressed: () {
              User user = User(name: 'Stepan', age: 20);
              Navigator.pushNamed(context, '/second', arguments: user);
            }
          )
        )
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.name} - ${user.age}"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go back'),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      )
    );
  }
}


class User{
  final String name;
  final int age;
  User({required this.name, required this.age});
}