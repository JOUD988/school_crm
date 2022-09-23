import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReplyCard extends StatelessWidget {
  String userId;
  String message;
  String time;
  ReplyCard({this.message,this.userId,this.time});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(

        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
            minWidth: 145,
            minHeight: 60,

        ),
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),


          child: Stack(
            children: [
              Positioned(
                top: 5,
                left: 10,
                child:Text(
                  userId,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green[400],
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 25,
                  bottom: 25,
                ),
                child: Text(
                    message,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child:Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              )
            ],


          ),
        ),
      ),
    );
  }
}
/*
 ,
*/
