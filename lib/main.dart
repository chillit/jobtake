import 'package:flutter/material.dart';
import 'package:jobtake/userPage.dart';

void main() {
  print("hello");
  print("212");
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
  }

class User{
  final String username;
  final String email;


  const User({
    required this.username,
    required this.email,
});
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [
    const User(
      username: "dfdfdfg",
      email: "lfdpfdkgopdfkd",

    ),
    const User(
      username: "dfdfdfg",
      email: "lfdpfdkgopdfkd",

    ),
    const User(
      username: "dfdfdfg",
      email: "lfdpfdkgopdfkd",

    ),
    const User(
      username: "dfdfdfg",
      email: "lfdpfdkgopdfkd",

    ),
    const User(
      username: "dfdfdfg",
      email: "lfdpfdkgopdfkd",

    ),
    const User(
      username: "dfdfdfg",
      email: "lfdpfdkgopdfkd",

    ),
    const User(
      username: "dfdfdfg",
      email: "lfdpfdkgopdfkd",

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HEHE"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (centext,index) {
          final user = users[index];
          return Card(
            child: ListTile(
              title: Text(user.username),
              subtitle: Text(user.email),
              trailing: const Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserPage(user: user),
                ));
              },
            ),
          );
        }
      ),
    );
}}
