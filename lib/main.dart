import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Building ListView"),
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  final List<ListItem> items = List<ListItem>.generate(
      10000,
      (index) => index % 6 == 0
          ? HeadingItem('Heading $index')
          : MessageItem('Sender $index', 'Message body $index'));
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      if (item is HeadingItem) {
        return ListTile(
          title: Text(item.heading, style: Theme.of(context).textTheme.headlineMedium),
        );
      } else if (item is MessageItem) {
        return ListTile(
          title: Text(item.sender),
          subtitle: Text(item.body),
          leading: const Icon(Icons.insert_photo, color: Colors.red),
          trailing: const Icon(Icons.keyboard_arrow_right),
        );
      }
      return null;
      // return Card(
      //   child: ListTile(
      //     title: Text(items[index]),
      //     leading: const Icon(Icons.insert_photo, color: Colors.red),
      //     trailing: const Icon(Icons.keyboard_arrow_right),
      //   ),
      // );
    },
  );
}

abstract class ListItem{}

class HeadingItem implements ListItem{
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem{
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}