import 'package:flutter/material.dart';

class ManagerDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Drawer(
      backgroundColor: Colors.grey.shade300,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
          ),

        child: ListView(

          children: <Widget>[
            SafeArea(

              child: Container(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                     image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/school_logo.png")),

                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.airport_shuttle, color: Colors.blue),
              title: Text('Where is the bus?' , style: TextStyle(
                color: Colors.blueGrey.shade800,

              ),),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Container ())),

              },
            ),


          ],
        ),

    );

  }
}

