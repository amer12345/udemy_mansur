import 'package:flutter/material.dart';
import 'package:udemy_mansur/constance/constance.dart';
import 'package:udemy_mansur/shared/default_botten.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index) => buildTaskItem,
        separatorBuilder: (context , index) => Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
        itemCount: tasks.length);
  }
}
