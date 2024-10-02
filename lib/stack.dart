import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  var flag = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Routing"),
        ),
        body: Center(
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: 300,
            height: 187,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Stack(children: [
              const Image(
                image: NetworkImage(
                    "https://media1.tenor.com/m/DM7SdBiQKhEAAAAd/cat-underwater.gif"),
                fit: BoxFit.cover,
              ),
              Positioned(
                  right: 1,
                  top: -1,
                  child: IconButton(
                    icon: flag
                        ? const Icon(Icons.favorite, color: Colors.red, size: 25)
                        : const Icon(Icons.favorite_border, color: Colors.red, size: 25),
                    onPressed: () {
                      setState(() {
                        flag = !flag;
                      }
                      );
                    },
                  )),
              Positioned(
                right: 190,
                bottom: 5,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: 120,
                  height: 30,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text("Поделиться",
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
