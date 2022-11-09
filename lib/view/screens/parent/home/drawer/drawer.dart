import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolcrm/view/consatans/colors.dart';
import 'package:schoolcrm/view/screens/common/login/auth.dart';
import 'package:schoolcrm/view/screens/common/login/login.dart';
import 'package:schoolcrm/view/screens/parent/justify_absence.dart';
import 'package:schoolcrm/view/screens/parent/map/parents_map.dart';
import 'package:schoolcrm/view/screens/parent/marks/marks_list.dart';
import 'package:schoolcrm/view/screens/parent/programs/students_program.dart';


class ManagerDrawer extends StatelessWidget {

  Auth auth  = Auth();
  @override
  Widget build(BuildContext context) {

    return  Drawer(
      backgroundColor:secondaryColorLight ,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),topRight:Radius.circular(50) )
          ),

        child: ListView(

          children: <Widget>[
            SafeArea(
              child: Container(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                     image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/school_logo.jpeg")),
                  ),
                ),
              ),
            ),
            ListTile(
              
              trailing: Icon(Icons.airport_shuttle, color: primaryColor),

              title: Text('Bus tracking' , style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontSize: 15,
                fontFamily: "Readex_Pro",
              ),),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ParentsMap ())),

              },
            ),
            ListTile(

              trailing: Icon(Icons.add_road,color: primaryColor),

              title: Text('Marks' , style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontSize: 15,
                fontFamily: "Readex_Pro",
              ),),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MarksLists ())),

              },
            ),
            ListTile(

              trailing: Icon(Icons.alarm_off,color: primaryColor),

              title: Text('Justify absence' , style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontSize: 15,
                fontFamily: "Readex_Pro",
              ),),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => JustifyAbsence ())),

              },
            ),
            ListTile(

              trailing: Icon(Icons.warning_amber_outlined,color: primaryColor),

              title: Text('The program' , style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontSize: 15,
                fontFamily: "Readex_Pro",
              ),),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentsProgram())),

              },
            ),

            ListTile(

              trailing: Icon(Icons.logout, color: Colors.red),

              title: Text('Sign out' , style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontSize: 15,
                fontFamily: "Readex_Pro",
              ),),
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login ()));
              },
            ),



          ],
        ),

    );

  }
}

