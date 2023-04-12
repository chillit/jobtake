import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jobtake/userPage.dart';
import 'package:jobtake/resume.dart';

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
    home: resume(),
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

class User {
  final String speciality;
  final int age;
  final String country;
  final List<dynamic> courses;
  final String date;
  final String email;
  final String endEducation;
  final String fio;
  final String livingPlace;
  final String phone;
  final String salary;
  final String sex;
  final String startEducation;
  final List<dynamic> university;

  const User({
    required this.speciality,/*-*/
    required this.age,/*--*/
    required this.country,/*-*/
    required this.courses,/*-*/
    required this.date,/*--*/
    required this.email,/*-*/
    required this.endEducation,
    required this.fio,/*-*/
    required this.livingPlace,/*-*/
    required this.phone,/*-*/
    required this.salary,
    required this.sex,/*-*/
    required this.startEducation,
    required this.university,/*-*/
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
                child: Text("There is not any resumes"),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var user = User(
                      age: snapshot.data!.docs[index].get("age"),
                      speciality: snapshot.data!.docs[index].get('speciality'),
                      country: snapshot.data!.docs[index].get("country"),
                      courses: snapshot.data!.docs[index].get("courses"),
                      date: snapshot.data!.docs[index].get("date").toString(),
                      email: snapshot.data!.docs[index].get("email"),
                      endEducation: snapshot.data!.docs[index]
                          .get("endEducation")
                          .toString(),
                      fio: snapshot.data!.docs[index].get("fio"),
                      livingPlace:
                          snapshot.data!.docs[index].get("livingPlace"),
                      phone: snapshot.data!.docs[index].get("phone"),
                      salary: snapshot.data!.docs[index].get("salary"),
                      sex: snapshot.data!.docs[index].get("sex"),
                      startEducation: snapshot.data!.docs[index]
                          .get("startEducation")
                          .toString(),
                      university: snapshot.data!.docs[index].get("university"));
                  return Card(
                      child: ListTile(
                          title: Text(user.fio),
                          subtitle: Text(user.speciality),
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
