import 'package:flutter/material.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/screens/bus_tracking/parents_map.dart';

class ManagerDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Drawer(
      backgroundColor:secondaryColorLight ,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
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

              title: Text('تتبع الباص' , style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontSize: 15,
                fontFamily: "Readex_Pro",
              ),),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ParentsMap ())),

              },
            ),


          ],
        ),

    );

  }
}

