import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jobtake/resume.dart';
import 'package:jobtake/userPage.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA-39sLJX5LdWYH4n07Cj2JxcOeGtNv3v8",
          appId: "1:107061998400:android:1816d4126f39ba4f6a40a5",
          messagingSenderId: '107061998400',
          projectId: "jobtake-60c1f"));
  print("hello");
  runApp(MaterialApp(
    title: 'Take a job',
    debugShowCheckedModeBanner: false,
    home: kIsWeb? resume(): MyHomePage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return resume();
  }
}

class User {
  final int age;
  final String country;
  final String birthDate;
  final String email;
  final String fio;
  final String livingPlace;
  final String phone;
  final String salary;
  final String desiredJob;
  final String sex;
  final String aquiredAbilities;
  final List<dynamic> educations;
  final List<dynamic> universitys;
  final List<dynamic> courses;
  final List<dynamic> expirience;

  const User({
    required this.age,
    required this.country,
    this.courses = const [],
    required this.email,
    required this.fio,
    required this.livingPlace,
    required this.phone,
    required this.salary,
    required this.sex,
    this.universitys = const [],
    required this.aquiredAbilities,
    required this.birthDate,
    required this.desiredJob,
    this.educations = const [],
    this.expirience = const [],
  });
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All resumes"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                            height: 400,
                            child: Center(
                                child: ElevatedButton(
                              child: const Text("Close"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )));
                      });
                },
                icon: Icon(Icons.filter_alt_rounded))
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("people").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Нет резюме"),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var user = User(
                    age: snapshot.data!.docs[index].get("age"),
                    country: snapshot.data!.docs[index].get("country"),
                    courses: snapshot.data!.docs[index].data().containsKey("courses") ? snapshot.data!.docs[index].get("courses") : [],
                    birthDate: snapshot.data!.docs[index].get("birthDate"),
                    email: snapshot.data!.docs[index].get("email"),
                    fio: snapshot.data!.docs[index].get("fio"),
                    livingPlace: snapshot.data!.docs[index].get("livingPlace"),
                    phone: snapshot.data!.docs[index].get("phone"),
                    salary: snapshot.data!.docs[index].get("salary"),
                    sex: snapshot.data!.docs[index].get("sex"),
                    universitys: snapshot.data!.docs[index].data().containsKey("universitys") ? snapshot.data!.docs[index].get("universitys") : [],
                    aquiredAbilities:
                        snapshot.data!.docs[index].get("aquiredAbilities"),
                    desiredJob: snapshot.data!.docs[index].get("desiredJob"),
                    educations: snapshot.data!.docs[index].data().containsKey("educations") ? snapshot.data!.docs[index].get("educations") : [],
                    expirience: snapshot.data!.docs[index].data().containsKey("expirience") ? snapshot.data!.docs[index].get("expirience") : [],
                  );
                  return Card(
                      child: ListTile(
                          title: Text(user.fio),
                          subtitle: Text(user.desiredJob),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserPage(user: user),
                            ));
                          }));
                });
          },
        ));
  }
}
