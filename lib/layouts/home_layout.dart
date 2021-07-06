import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  String? _selectedTime;

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
          if(isBottomSheetShown){
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              fabIcon = Icons.edit;
            });
          }else{
            scaffoldKey.currentState!.showBottomSheet(
                    (context) => Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.all(20),
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
                              onTap: (){return null;}
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultTextFromField(
                              controller: timeController,
                              type: TextInputType.datetime,
                              label: 'Time Task',
                              prefix: Icons.watch_later_outlined,
                              onTap: ()
                              // => showTimePicker(context: context, initialTime:TimeOfDay.now()).then((value) {print(value!.format(context));}),
                              {
                                // _show();
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  print(value!.format(context));
                                });
                              },
                              validate: (String? value){
                                if (value!.isEmpty)
                                {
                                  return ' time must not be empty';
                                }
                                return null;
                              },
                              onChanged: (){return null;},
                              onSubmit: (){return null;},
                          )
                        ],
                      ),
                    )
            );
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

  Future <String>  getName() async
  {
    return ('Amer Kanjo');
  }

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
       print('DataBase opened');

     }
   );
  }

  void insertToDataBase ()
  {
   dataBase.transaction((txn)
   {
     txn.rawInsert('INSERT INTO tasks(title,date,time,status) VALUES("first task","0222","855","new")').then((value){
       print('$value inserted successfully');
     } ).catchError((error){
       print('error when New record');

     });
     return null;
   });
  }

  // Future<void> _show() async {
  //   final TimeOfDay? result = await showTimePicker(
  //       context: context, initialTime: TimeOfDay.now() );
  //   if (result != null) {
  //     setState(() {
  //       _selectedTime = result.format(context);
  //     });
  //   }
  // }

}
