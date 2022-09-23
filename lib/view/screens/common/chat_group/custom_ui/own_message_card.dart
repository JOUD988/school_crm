import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OwnMessageCard extends StatelessWidget {

  final String message;
  final String time;
  OwnMessageCard({this.message,this.time});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(

          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
            minWidth: 140
          ),
        child: Card(
            elevation: 5,

            color: Color(0xffdcf8c6),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),


          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
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
                child: Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done,
                      size: 20,
                    ),
                  ],
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
