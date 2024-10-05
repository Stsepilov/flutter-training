import 'package:flutter/material.dart';
import '../model/user.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key, required this.userInfo});

  final User userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Info'),
          centerTitle: true,
        ),
        body: Card(
            margin: const EdgeInsets.all(16.0),
            child: Column(children: [
              ListTile(
                  title: Text('${userInfo.name}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  subtitle: userInfo.story!.isNotEmpty ? Text('${userInfo.story}') : null,
                  leading: Icon(Icons.person, color: Colors.black),
                  trailing: userInfo.country != null
                      ? Text('${userInfo.country}')
                      : const Text('')),
              ListTile(
                title: Text('${userInfo.phone}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                leading: Icon(Icons.phone, color: Colors.black),
              ),
              ListTile(
                title: Text('${userInfo.email}',
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                leading: Icon(userInfo.email!.isNotEmpty ? Icons.mail : null, color: Colors.black),
              )
            ])));
  }
}
