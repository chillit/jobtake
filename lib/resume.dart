import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class resume extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<resume> {
  TextEditingController _date = TextEditingController();
  TextEditingController fio = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController livingPlace = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController desiredJob = TextEditingController();
  TextEditingController aquiredAbilities= TextEditingController();

  int _value = 1;
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";

  //EDUCATIONS
  List<TextFormField> educations = [];
  List<TextEditingController> eFieldController = [];

  //UNIVERSITYS
  List<TextFormField> universitys = [];
  List<TextEditingController> uFieldController = [];

  //COURSES
  List<TextFormField> courses = [];
  List<TextEditingController> cFieldController = [];

  //EXPIRIENCE  
  List<TextFormField> expirience = [];
  List<TextEditingController> exFieldController = [];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Отправка резюме"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                Form(
                  key: formKey, //key for form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: fio,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Введите ваше ФИО"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Введите ваше ФИО";
                          }
                        },
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Введите вашу электронную почту"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            print(value);
                            return "Введите вашу электронную почту";
                          }
                        },
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
                      TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                            icon: Icon(Icons.smartphone_outlined),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Введите ваш номер телефона"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Введите ваш номер телефона";
                          }
                        },
                      ),
                      TextFormField(
                        controller: _date,
                        decoration: InputDecoration(
                            icon: Icon(Icons.date_range_outlined),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Введите ваш год рождения"),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          if (pickeddate != null) {
                            setState(() {
                              _date.text =
                                  DateFormat("yyyy-MM-dd").format(pickeddate);
                            });
                          }
                        },
                        validator: (value) {
                          print(value);
                          if (value!.isEmpty) {
                            return "Введите ваш год рождения";
                          }
                        },
                      ),
                      TextFormField(
                        controller: country,
                        decoration: InputDecoration(
                            icon: Icon(Icons.document_scanner_outlined),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Введите ваше гражданство"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Введите ваше гражданство";
                          }
                        },
                      ),
                      TextFormField(
                        controller: livingPlace,
                        decoration: InputDecoration(
                            icon: Icon(Icons.house_outlined),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Введите ваш адрес проживания"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Введите ваш адрес проживания";
                          }
                        },
                      ),
                      TextFormField(
                        controller: salary,
                        decoration: InputDecoration(
                            icon: Icon(Icons.attach_money),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Желаемая ЗП"),
                        validator: (value) {
                          print(value);
                          if (value!.isEmpty) {
                            return "Желаемая ЗП";
                          }
                        },
                      ),
                      TextFormField(
                        controller: desiredJob,
                        decoration: InputDecoration(
                            icon: Icon(Icons.work_outline),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Желаемая Должность"),
                        validator: (value) {
                          print(value);
                          if (value!.isEmpty) {
                            return "Желаемая Должность";
                          }
                        },
                      ),
                      //EDUCATIONS
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Образования:",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      ...educations,
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                child: Text("+", style: TextStyle(fontSize:30)),
                                onPressed: () {
                                  eFieldController.add(TextEditingController());
                                  setState(() {
                                    educations.add(TextFormField(
                                      controller: eFieldController.last,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.school_outlined),
                                          enabledBorder: UnderlineInputBorder(
                                            //<-- SEE HERE
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          labelText:
                                              "Введите ваше оброзование"),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Введите ваше оброзование";
                                        }
                                      },
                                    ));
                                  });
                                },
                              )),
                          Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                child: Text("-", style: TextStyle(fontSize:30)),
                                onPressed: () {
                                  if (!educations.isEmpty) {
                                    setState(() {
                                      educations.removeLast();
                                      eFieldController.removeLast();
                                    });
                                  }
                                },
                              )),
                        ],
                      ),
                      //UNIVERSITYS
                      Divider(
                        color: Colors.grey[700],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Учебные заведения:",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      ...universitys,
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                child: Text("+", style: TextStyle(fontSize:30)),
                                onPressed: () {
                                  uFieldController.add(TextEditingController());
                                  setState(() {
                                    universitys.add(TextFormField(
                                      controller: uFieldController.last,
                                      decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.location_city_outlined),
                                          enabledBorder: UnderlineInputBorder(
                                            //<-- SEE HERE
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          labelText:
                                              "Введите учебное заведение"),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Введите учебное заведение";
                                        }
                                      },
                                    ));
                                  });
                                },
                              )),
                          Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                child: Text("-", style: TextStyle(fontSize:30)),
                                onPressed: () {
                                  if (!universitys.isEmpty) {
                                    setState(() {
                                      universitys.removeLast();
                                      uFieldController.removeLast();
                                    });
                                  }
                                },
                              )),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[700],
                      ),
                      /*TextFormField(
                        controller: _end_date,
                        decoration: InputDecoration(
                            icon: Icon(Icons.edit_calendar_outlined),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Введите год окончания учебы"),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          if (pickeddate != null) {
                            setState(() {
                              _end_date.text =
                                  DateFormat("yyyy-MM-dd").format(pickeddate);
                            });
                          }
                        },
                      validator: (value) {
                          print(value);
                          if (value!.isEmpty) {
                            return "Введите год окончания учебы";
                          }
                        },
                      ),
                      TextFormField(
                        controller: _start_date,
                        decoration: InputDecoration(
                            icon: Icon(Icons.edit_calendar_outlined),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(width: 1, color: Colors.blue),
                            ),
                            labelText: "Введите год начала учебы"),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          if (pickeddate != null) {
                            setState(() {
                              _start_date.text =
                                  DateFormat("yyyy-MM-dd").format(pickeddate);
                            });
                          }
                        },
                        validator: (value) {
                          print(value);
                          if (value!.isEmpty) {
                            return "Введите год начала учебы";
                          }
                        },
                      ),*/
                      //COURSES
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Курсы:",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      ...courses,
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                child: Text("+", style: TextStyle(fontSize:30)),
                                onPressed: () {
                                  cFieldController.add(TextEditingController());
                                  setState(() {
                                    courses.add(TextFormField(
                                      controller: cFieldController.last,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.laptop_mac_outlined),
                                          enabledBorder: UnderlineInputBorder(
                                            //<-- SEE HERE
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          labelText: "Введите пройденный курс"),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Введите пройденный курс";
                                        }
                                      },
                                    ));
                                  });
                                },
                              )),
                          Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                child: Text("-", style: TextStyle(fontSize:30)),
                                onPressed: () {
                                  if (!courses.isEmpty) {
                                    setState(() {
                                      courses.removeLast();
                                      cFieldController.removeLast();
                                    });
                                  }
                                },
                              )),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[700],
                      ),
                      //EXPIRIENCE
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Опыт работы:",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      ...expirience,
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                child: Text("+", style: TextStyle(fontSize:30)),
                                onPressed: () {
                                  exFieldController
                                      .add(TextEditingController());
                                  setState(() {
                                    expirience.add(TextFormField(
                                      controller: exFieldController.last,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.people_outline),
                                          enabledBorder: UnderlineInputBorder(
                                            //<-- SEE HERE
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          labelText: "Введите организацию"),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Введите организацию";
                                        }
                                      },
                                    ));
                                  });

                                  exFieldController
                                      .add(TextEditingController());
                                  setState(() {
                                    expirience.add(TextFormField(
                                      controller: exFieldController.last,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.work_history_outlined),
                                          enabledBorder: UnderlineInputBorder(
                                            //<-- SEE HERE
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          labelText: "Введите должность"),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Введите должность";
                                        }
                                      },
                                    ));
                                  });

                                  exFieldController
                                      .add(TextEditingController());
                                  setState(() {
                                    expirience.add(TextFormField(
                                      controller: exFieldController.last,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.task_outlined),
                                          enabledBorder: UnderlineInputBorder(
                                            //<-- SEE HERE
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          labelText: "Введите обязанности"),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Введите обязанности";
                                        }
                                      },
                                    ));
                                  });
                                },
                              )),
                          Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                child: Text("-", style: TextStyle(fontSize:30)),
                                onPressed: () {
                                  if (!expirience.isEmpty) {
                                    setState(() {
                                      expirience.removeLast();
                                      exFieldController.removeLast();
                                      expirience.removeLast();
                                      exFieldController.removeLast();
                                      expirience.removeLast();
                                      exFieldController.removeLast();
                                    });
                                  }
                                },
                              )),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[700],
                      ),
                      TextFormField(
                                      controller: aquiredAbilities,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.star_border_outlined),
                                          enabledBorder: UnderlineInputBorder(
                                            //<-- SEE HERE
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.blue),
                                          ),
                                          labelText: "Приобретенные навыки"),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Приобретенные навыки";
                                        }
                                      },
                                    ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.only(bottom: 20)),
                GestureDetector(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      FirebaseFirestore.instance.collection('people').add({
                        'fio' : fio.text,
                        'email' : email.text,
                        'sex' : _value == 1 ? 'male' : 'female',
                        'phone' : phone.text,
                        'birthDate' : _date.text,
                        'age' : calculateAge(DateTime.parse(_date.text)),
                        'country' : country.text,
                        'livingPlace' : livingPlace.text,
                        'salary' : salary.text,
                        'desiredJob' : desiredJob.text,
                        'educations' : eFieldController.map((e) => e.text).toList(),
                        'universitys' : uFieldController.map((e) => e.text).toList(),
                        'courses' : cFieldController.map((e) => e.text).toList(),
                        'expirience' : getExpirience(exFieldController),
                        'aquiredAbilities' : aquiredAbilities.text,
                      });
                    }
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Отправить',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(bottom: 15)),
              ],
            )));
  }
}

int calculateAge(DateTime birthDate){
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  if(birthDate.month > currentDate.month){
    age--;
  }else if(birthDate.month == currentDate.month && birthDate.day > currentDate.day){
    age--;
  }
  return age;
}

List<Map<String,String>> getExpirience(List<TextEditingController> exp){
  List<Map<String,String>> result = [];
  for(int i = 0;i < exp.length;i += 3){
    var bufer = {
      'organization' : exp[i].text,
      'job' : exp[i+1].text,
      'functions' : exp[i+2].text
    };
    result.add(bufer);
  }
  return result;
}