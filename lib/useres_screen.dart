import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersModel {
  final int? id ;
  final String? name;
  final String? phone;

  UsersModel({
    @required this.id,
    @required this.name,
    @required this.phone,
});
}

class UsersScreen extends StatelessWidget {
  // const UsersScreen({Key? key}) : super(key: key);
  List<UsersModel> users = [
    UsersModel(
      id: 1,
      name: 'amer',
      phone: '006594545',
    ),
    UsersModel(
      id: 2,
      name: 'kais',
      phone: '77794545',
    ),
    UsersModel(
      id: 3,
      name: 'laith',
      phone: '7567865',
    ),
    UsersModel(
      id: 1,
      name: 'amer',
      phone: '006594545',
    ),
    UsersModel(
      id: 2,
      name: 'kais',
      phone: '77794545',
    ),
    UsersModel(
      id: 3,
      name: 'laith',
      phone: '7567865',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context , index)=> usersItem(users[index]),
          separatorBuilder: (context , index)=> Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          itemCount: users.length) ,
    );
  }

  Widget usersItem(UsersModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 25,
          child: Text(
            '${user.id}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '${user.phone!}',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
