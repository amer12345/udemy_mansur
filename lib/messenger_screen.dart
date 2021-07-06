import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MessengerScreen extends StatelessWidget {
  // const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage('https://scontent.fruh4-3.fna.fbcdn.net/v/t1.18169-9/29497360_362031624282656_1363717707508327995_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=faZlpwJLsp8AX-KlZ61&_nc_ht=scontent.fruh4-3.fna&oh=835bd5cfc9c8fc1cc24fe9712a9aea9c&oe=60D2A430'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ],
        ),
        titleSpacing: 20,
        actions: [
          IconButton(
              icon: CircleAvatar(
                radius: 15,
                child: Icon(
                    Icons.camera_alt,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            onPressed: (){},
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 15,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 16,
              ),
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5
                  ),
                  color: Colors.grey[400],
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search'
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration( boxShadow:[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, -2), // changes position of shadow
                  ),
                ], ),
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index) => buildStoryItem(),
                  itemCount: 6,
                  separatorBuilder: (context , index) => SizedBox(
                    width: 20,
                  ),
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                  itemCount: 15)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() => Row(
    children: [
      Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://scontent.fruh4-3.fna.fbcdn.net/v/t1.18169-9/29497360_362031624282656_1363717707508327995_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=faZlpwJLsp8AX-KlZ61&_nc_ht=scontent.fruh4-3.fna&oh=835bd5cfc9c8fc1cc24fe9712a9aea9c&oe=60D2A430'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 7,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Amer Kanjo Samer Ahmed',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildChatItem() => Container(
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://scontent.fruh4-3.fna.fbcdn.net/v/t1.18169-9/29497360_362031624282656_1363717707508327995_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=faZlpwJLsp8AX-KlZ61&_nc_ht=scontent.fruh4-3.fna&oh=835bd5cfc9c8fc1cc24fe9712a9aea9c&oe=60D2A430'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 7,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amer Kanjo Flutter dev',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Hello there I\m here now ,, what do you want what do you want what do you want',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                      '02:30 PM'
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

}
