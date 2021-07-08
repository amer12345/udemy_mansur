import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:udemy_mansur/modules/archived_screen.dart';
import 'package:udemy_mansur/modules/done_screen.dart';
import 'package:udemy_mansur/modules/new_tasks_screen.dart';
import 'package:udemy_mansur/shared/default_botten.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<String> titles =
  [
    ' New Tasks',
    'Done',
    'Archived',
  ];

  List<Widget> screen =
      [
        NewTasksScreen(),
        DoneScreen(),
        ArchivedScreen()
      ];

  late Database dataBase;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  List<Map> tasks = [];

  @override
  void initState() {
    super.initState();
    createDataBase ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
            titles[currentIndex]
        ),
      ),
      body: screen[currentIndex],

      floatingActionButton: FloatingActionButton(
        onPressed:  ()
        {
          if(isBottomSheetShown)
          {
            if(formKey.currentState!.validate())
            {
              insertToDataBase(
                date: dateController.text,
                time: timeController.text,
                title: titleController.text,
              ).then((value)
              {
                Navigator.pop(context);
                isBottomSheetShown = false;
                setState(() {
                  fabIcon = Icons.edit;
                });
              });
            }

          }else{
            scaffoldKey.currentState!.showBottomSheet(
                    (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultTextFromField(
                                controller: titleController,
                                type: TextInputType.text,
                                label: 'Title Task',
                                prefix: Icons.title,
                                validate: (String? value){
                                  if (value!.isEmpty)
                                  {
                                    return 'title must not be empty';
                                  }
                                  return null;
                                },
                                onChanged: (){return null;},
                                onSubmit: (){return null;},
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: timeController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                labelText: 'Tasks Time',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.watch_later_outlined),
                              ),
                              onTap: ()
                              {
                                // _show();
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  timeController.text = value!.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              validator: (String? value){
                                if (value!.isEmpty)
                                {
                                  return ' time must not be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: dateController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                labelText: 'Tasks Date',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.calendar_today),
                              ),
                              onTap: ()
                              {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-02-02')
                                ).then((value)
                                {
                                  dateController.text= DateFormat.yMMMd().format(value!);
                                });
                              },
                              validator: (String? value){
                                if (value!.isEmpty)
                                {
                                  return ' date must not be empty';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
              elevation: 20,
            ).closed.then((value)
            {
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(
            fabIcon
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.menu
              ),
            label: 'Tasks'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.check_circle
              ),
              label: 'Done'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.account_circle
              ),
              label: 'Archived'
          ),
        ],
      ),
    );
  }

  // Future <String>  getName() async
  // {
  //   return ('Amer Kanjo');
  // }

  void createDataBase () async
  {
    dataBase = await openDatabase(
     'todo.db',
     version: 1,
     onCreate: (dataBase , version)
     {
       print('DataBase Created');
       dataBase.execute('CREATE TABLE TASKS (id INTEGER PRIMARY KEY,title TEXT , date TEXT, time TEXT, status TEXT)').then((value) =>
       print ('table created')
       ).catchError((error){});
     },
     onOpen: (dataBase)
     {
       getDataFromDatabase(dataBase).then((value)
       {
         tasks = value;
       });
       print('DataBase opened');

     }
   );
  }

  Future insertToDataBase ({
  @required title,
  @required time,
  @required date,
}) async
  {
   return await dataBase.transaction((txn)
   {
     txn.rawInsert('INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")').then((value){
       print('$value inserted successfully');
     } ).catchError((error){
       print('error when New record');

     });
     return null;
   });
  }


  Future<List<Map>> getDataFromDatabase (dataBase) async
  {
     return  await dataBase.rawQuery('SELECT * FROM tasks');
  }
}
