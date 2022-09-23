import 'package:flutter/material.dart';
import 'package:schoolcrm/controller/marks_controller.dart';
import 'package:schoolcrm/view/components/app_bar_style.dart';
import 'package:schoolcrm/view/consatans/colors.dart';
import 'package:schoolcrm/view/consatans/fonts.dart';

class MarksLists extends StatefulWidget {
  @override
  State<MarksLists> createState() => _MarksListsState();
}

class _MarksListsState extends State<MarksLists> {
  MarksController marksController = MarksController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: FutureBuilder(
            future: marksController.getStudentMarks("studentName"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null)
                return (Text(""));
              else {
                return Text(
                  snapshot.data[1].studentName,
                  style: TextStyle(fontFamily: readexFont),
                );
              }
            }),
        systemOverlayStyle: systemOverlayStyle,
        shape: shape,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
        color: secondaryColorLight,
        child: FutureBuilder(
            future: marksController.getStudentMarks("studentName"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                    child: Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shadowColor: primaryColor,
                        color: Colors.blueGrey.shade200,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.green.shade300,
                              width: 3,
                              style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          title: Text(
                            snapshot.data[index].course,
                            style: TextStyle(fontFamily: cairoFont),
                          ),
                          subtitle: Text(snapshot.data[index].mark),
                          trailing: Text(
                            snapshot.data[index].category,
                            style: TextStyle(fontFamily: readexFont),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Icon(Icons.book),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
