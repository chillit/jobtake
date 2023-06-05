import 'package:flutter/material.dart';

class FilterCustom extends StatefulWidget {
  const FilterCustom({super.key});

  @override
  State<FilterCustom> createState() => FilterCustomState();
}

class FilterCustomState extends State<FilterCustom> {
  final fio = TextEditingController();
  int _value = 1;
  final ageFrom = TextEditingController();
  final ageUntil = TextEditingController();
  final salaryFrom = TextEditingController();
  final salaryUntil = TextEditingController();
  final country = TextEditingController();
  final desiredJob = TextEditingController();
  final education = TextEditingController();
  final university = TextEditingController();
  final course = TextEditingController();
  final abilities = TextEditingController();

  static String fiotext = "";
  static int ageFromtext = 0;
  static int ageUntiltext = 100;
  static int salaryFromtext = 0;
  static int salaryUntiltext = 99999999999;
  static String countrytext = "";
  static String desiredJobtext = "";
  static String educationtext = "";
  static String universitytext = "";
  static String coursetext = "";
  static String abilitiestext = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Фильтрация"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              fiotext = fio.text;
              ageFromtext = int.parse(ageFrom.text);
              ageUntiltext = int.parse(ageUntil.text);
              salaryFromtext = int.parse(salaryFrom.text);
              salaryUntiltext = int.parse(salaryUntil.text);
              countrytext = country.text;
              desiredJobtext = desiredJob.text;
              educationtext = education.text;
              universitytext = university.text;
              coursetext = course.text;
              abilitiestext = abilities.text;
            },
            child: SizedBox(
                height: double.infinity,
                width: MediaQuery.of(context).size.width / 7,
                child: Icon(Icons.search)),
          )
        ],
      ),
      body: SizedBox(
          height: 600,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: fio,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        enabledBorder: UnderlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        labelText: "ФИО"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Text(
                          "Возраст:",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: ageFrom,
                          decoration: InputDecoration(
                              icon: Icon(Icons.date_range_outlined),
                              enabledBorder: UnderlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue),
                              ),
                              labelText: "От"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          controller: ageUntil,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue),
                              ),
                              labelText: "До"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 5)),
                      Row(
                        children: [
                          Icon(Icons.male),
                          Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Мужчина"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.female),
                          Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Женщина"),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Text(
                          "Желаемая заработная плата:",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: salaryFrom,
                          decoration: InputDecoration(
                              icon: Icon(Icons.attach_money_outlined),
                              enabledBorder: UnderlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue),
                              ),
                              labelText: "От"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          controller: salaryUntil,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(width: 1, color: Colors.blue),
                              ),
                              labelText: "До"),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: country,
                    decoration: InputDecoration(
                        icon: Icon(Icons.document_scanner_outlined),
                        enabledBorder: UnderlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        labelText: "Гражданство"),
                  ),
                  TextField(
                    controller: desiredJob,
                    decoration: InputDecoration(
                        icon: Icon(Icons.work_outline),
                        enabledBorder: UnderlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        labelText: "Желаемая должность"),
                  ),
                  TextField(
                    controller: education,
                    decoration: InputDecoration(
                        icon: Icon(Icons.school_outlined),
                        enabledBorder: UnderlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        labelText: "Образование"),
                  ),
                  TextField(
                    controller: university,
                    decoration: InputDecoration(
                        icon: Icon(Icons.location_city_outlined),
                        enabledBorder: UnderlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        labelText: "Университет"),
                  ),
                  TextField(
                    controller: course,
                    decoration: InputDecoration(
                        icon: Icon(Icons.laptop_mac_outlined),
                        enabledBorder: UnderlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        labelText: "Курс"),
                  ),
                  TextField(
                    controller: abilities,
                    decoration: InputDecoration(
                        icon: Icon(Icons.star_border_outlined),
                        enabledBorder: UnderlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        labelText: "Приобретенные навыки"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
