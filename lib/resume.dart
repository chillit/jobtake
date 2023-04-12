import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class resume extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<resume> {
  TextEditingController _date = TextEditingController();
  int _value = 1;
  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: const Text("HEHE"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child:Column(
            children: [
              Form(
                key: formKey, //key for form
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите ваше ФИО"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Введите ваше ФИО";
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите вашу электранную почту"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          print(value);
                          return "Введите вашу электранную почту";
                        }
                      },
                    ),
                    Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: const EdgeInsets.only(top:5)),
                        Row(children: [
                          Icon(Icons.male),
                          Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value){
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          Text("Male"),
                        ],),
                        Row(children: [
                          Icon(Icons.female),
                          Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (value){
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          Text("Female"),
                        ],),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.smartphone_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите ваш номер телефона"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Введите вашу номер телефона";
                        }
                      },
                    ),
                    TextField(
                      controller: _date,
                      decoration: InputDecoration(
                          icon: Icon(Icons.date_range_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите ваш год рождения"
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if(pickeddate != null){
                          setState(() {
                            _date.text = DateFormat("yyyy-MM-ddd").format(pickeddate);
                          });
                        }

                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.document_scanner_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите ваше гражданство"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Введите ваше гражданство";
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.house_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите ваш адресс проживания"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Введите ваше адресс проживания";
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.work_history_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите вашу специальность"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Введите вашу специальность";
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.school_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите университет законченный вами"
                      ),
                      validator: (value){
                        print(value);
                        if(value!.isEmpty){
                          return "Введите университет законченный вами";
                        }
                      },
                    ),
                    TextField(
                      controller: _date,
                      decoration: InputDecoration(
                          icon: Icon(Icons.edit_calendar_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите год окончания учебы"
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if(pickeddate != null){
                          setState(() {
                            _date.text = DateFormat("yyyy-MM-ddd").format(pickeddate);
                          });
                        }

                      },
                    ),
                    TextField(
                      controller: _date,
                      decoration: InputDecoration(
                          icon: Icon(Icons.edit_calendar_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите год началы учебы"
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if(pickeddate != null){
                          setState(() {
                            _date.text = DateFormat("yyyy-MM-ddd").format(pickeddate);
                          });
                        }

                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.laptop_mac_outlined),
                          enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue),
                          ),
                          labelText: "Введите курсы, которые вы проходили"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Введите курсы, которые вы проходили";
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20)),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: Center(child:
                  Text(
                      'Отправить',
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 15)),

            ],
          )

        )
    );
  }


}