import "package:flutter/material.dart";
import "package:flutter/services.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
        iconTheme: const IconThemeData(color: Colors.black54),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: _buildBody(),
    ));
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _weatherDescription(),
                      const Divider(indent: 10, endIndent: 10, color: Colors.black54),
                      _temperature(),
                      const Divider(indent: 10, endIndent: 10, color: Colors.black54),
                      _temperatureForecast(),
                      const Divider(indent: 10, endIndent: 10, color: Colors.black54),
                      _footerRatings(),
                    ])))
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://img4.goodfon.ru/original/800x480/e/c5/priroda-oblaka-solnyshko-iasnaia-pogoda.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return const Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    Text("Tuesday May 22",
        style: TextStyle(
            color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
    Divider(indent: 10, endIndent: 10, color: Colors.black54),
    Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque odio ligula, sagittis ut mi vel, tincidunt porttitor urna. Proin eu pretium diam. Curabitur gravida diam volutpat, fermentum nunc nec, accumsan odio.',
        style: TextStyle(color: Colors.black54))
  ]);
}

Row _temperature() {
  return const Row(mainAxisAlignment: MainAxisAlignment.center,children: [
    Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      Icon(Icons.wb_sunny, color: Colors.yellow),
    ]),
    SizedBox(width: 16),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text("15°C Clear", style: TextStyle(color: Colors.purpleAccent)),
      ]),
      Row(children: [
        Text("Murmanskaya Oblast, Murmansk", style: TextStyle(color: Colors.grey)),
      ])
    ]),
  ]);
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children:
      List.generate(7, (int index){
        return Chip(
          label: Text('${index + 20}°C', style: const TextStyle(fontSize:15)),
          avatar: const Icon(Icons.wb_cloudy, color: Colors.lightBlue),
        );
  }),
  );
}

Row _footerRatings(){
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Info with openweathermap.com", style: TextStyle(fontSize: 15)),
      SizedBox(width: 24),
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.black),
      Icon(Icons.star, size: 15, color: Colors.black),
    ]
  );
}