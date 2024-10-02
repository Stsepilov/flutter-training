import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: const Text("Weather Forecast",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textField(),
              const SizedBox(height: 20),
              _cityDetail(),
              const SizedBox(height: 30),
              _temperatureDetail(),
              const SizedBox(height: 30),
              _extraWeatherDetail(),
              const SizedBox(height: 80),
              const Text("7-DAY WEATHER FORECAST",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300)),
              const SizedBox(height: 20),
              _bottomDetail(),
            ],
          ),
        ),
      ),
    );
  }
}

TextField _textField() {
  return const TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: "Enter City Name",
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.search, color: Colors.white, size: 30),
      ));
}

Column _cityDetail() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("Murmansk Oblast, RU",
          style: TextStyle(fontSize: 35, color: Colors.white)),
      Text("Friday, Mar 20, 2020",
          style: TextStyle(color: Colors.white, fontSize: 20)),
    ],
  );
}

Row _temperatureDetail() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.wb_sunny, color: Colors.white, size: 100),
      SizedBox(
        width: 30,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('14°F',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w200)),
            Text('LIGHT SNOW',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w200)),
          ]),
    ],
  );
}

Row _extraWeatherDetail() {
  return const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Column(children: [
      Icon(
        Icons.ac_unit,
        color: Colors.white,
        size: 30,
      ),
      Text('5',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300)),
      Text('km/hr',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300)),
    ]),
    Column(children: [
      Icon(
        Icons.ac_unit,
        color: Colors.white,
        size: 30,
      ),
      Text('3',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300)),
      Text('%',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300)),
    ]),
    Column(children: [
      Icon(
        Icons.ac_unit,
        color: Colors.white,
        size: 30,
      ),
      Text('20',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300)),
      Text('%',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300)),
    ]),
  ]);
}

SizedBox _bottomDetail() {
  return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red.shade200,
            ),
            height: 120,
            width: 160,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Friday',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('6°F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red.shade200,
            ),
            height: 120,
            width: 160,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Saturday',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('5°F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red.shade200,
            ),
            height: 120,
            width: 160,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Sunday',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('10°F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red.shade200,
            ),
            height: 120,
            width: 160,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Monday',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('8°F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red.shade200,
            ),
            height: 120,
            width: 160,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Tuesday',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('7°F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red.shade200,
            ),
            height: 120,
            width: 160,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Wednesday',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('6°F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red.shade200,
            ),
            height: 120,
            width: 160,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Thursday',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('9°F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ));
}
