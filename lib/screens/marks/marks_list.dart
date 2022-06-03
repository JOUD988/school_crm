import 'package:flutter/material.dart';
import 'package:schoolcrm/constans/app_bar_style.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/fonts.dart';
import 'package:schoolcrm/screens/marks/server.dart';

class Marks extends StatefulWidget {
  @override
  State<Marks> createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text("Joud Nassar",style: TextStyle(fontFamily: readexFont),),
        systemOverlayStyle: systemOverlayStyle,
        shape: shape,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
        color: secondaryColorLight,
        child: ListView(
          children: [

            Card(
              shadowColor: primaryColor,

              color: Colors.lightGreen.shade200,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.green.shade300,width: 3,style: BorderStyle.none
                ),
                borderRadius: BorderRadius.circular(15.0),

              ),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text("الفيزياء",style: TextStyle(fontFamily: cairoFont),),
                subtitle: Text("20"),
                trailing: Text("مذاكرة ١",style: TextStyle(fontFamily: readexFont),),
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.book),
                ),
              ),
            ),
            Card(
              shadowColor: primaryColor,

              color: Colors.lightGreen.shade200,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.green.shade300,width: 3,style: BorderStyle.none
                ),
                borderRadius: BorderRadius.circular(15.0),

              ),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text("الفيزياء",style: TextStyle(fontFamily: cairoFont),),
                subtitle: Text("20"),
                trailing: Text("مذاكرة ١",style: TextStyle(fontFamily: readexFont),),
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.book),
                ),
              ),
            ),
            Card(
              shadowColor: primaryColor,

              color: Colors.lightGreen.shade200,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.green.shade300,width: 3,style: BorderStyle.none
                ),
                borderRadius: BorderRadius.circular(15.0),

              ),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text("الفيزياء",style: TextStyle(fontFamily: cairoFont),),
                subtitle: Text("20"),
                trailing: Text("مذاكرة ١",style: TextStyle(fontFamily: readexFont),),
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.book),
                ),
              ),
            ),
            Card(
              shadowColor: primaryColor,

              color: Colors.lightGreen.shade200,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.green.shade300,width: 3,style: BorderStyle.none
                ),
                borderRadius: BorderRadius.circular(15.0),

              ),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text("الفيزياء",style: TextStyle(fontFamily: cairoFont),),
                subtitle: Text("20"),
                trailing: Text("مذاكرة ١",style: TextStyle(fontFamily: readexFont),),
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.book),
                ),
              ),
            ),
            Card(
              shadowColor: primaryColor,

              color: Colors.lightGreen.shade200,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.green.shade300,width: 3,style: BorderStyle.none
                ),
                borderRadius: BorderRadius.circular(15.0),

              ),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text("الفيزياء",style: TextStyle(fontFamily: cairoFont),),
                subtitle: Text("20"),
                trailing: Text("مذاكرة ١",style: TextStyle(fontFamily: readexFont),),
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.book),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
