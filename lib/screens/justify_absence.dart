import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolcrm/constans/app_bar_style.dart';
import 'package:schoolcrm/constans/colors.dart';
import 'package:schoolcrm/constans/fonts.dart';
import 'package:schoolcrm/constans/time.dart';
import 'package:http/http.dart' as http;


class JustifyAbsence extends StatefulWidget {
  @override
  State<JustifyAbsence> createState() => _JustifyAbsenceState();
}

class _JustifyAbsenceState extends State<JustifyAbsence> {

  TextEditingController dateInput = TextEditingController();
   List<PlatformFile> _files;
  bool isLoadedImage ;

  @override
  void initState() {
    super.initState();
    dateInput.text = Time().getCurrentDate();
    isLoadedImage = false;

  }
  void _uploadFile() async {
    var uri = Uri.parse('http://10.0.2.2:8080/test');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', _files.first.path.toString()));
    var response = await request.send();
    if(response.statusCode == 200) {
      print('Uploaded ...');
    } else {
      print('Something went wrong!');
    }

  }

  void _openFileExplorer() async {
    _files = (await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        allowedExtensions: null
    )).files;

    setState(() {
      isLoadedImage = true;

    });

    print('Loaded file path is : ${_files.first.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        shape: shape,
        systemOverlayStyle: systemOverlayStyle,
        centerTitle: true,
        title: Text("تبرير غياب",
        style: TextStyle(
          fontFamily: readexFont,
          fontWeight: FontWeight.bold
        ),
        ),
      ),


        body: Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            color: secondaryColorLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: primaryColor, // set border color
                          width: 3.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0)),
                      // set rounded corner radius
                    ),
                    child: TextField(
                      controller: dateInput,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor),
                        ),


                          hintText: Time().getCurrentDate(),
                          icon: Icon(
                            Icons.calendar_today, color: primaryColor,),
                          labelText: "التاريخ",

                          labelStyle: TextStyle(
                            color: primaryColor,
                            fontSize: 23,

                          )


                      ),

                      readOnly: true,

                      onTap: () async {

                        datePicker();

                      },


                    )),
                SizedBox(height: 30,),
                Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: primaryColor, // set border color
                          width: 3.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0)),
                      // set rounded corner radius
                    ),
                  child:isLoadedImage? Text("التقرير الطبي جاهز للارسال"): Text("التقرير الطبي غير مرفوع"),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){_openFileExplorer();}, child: Text('ارفع التقرير'),style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(primaryColor)) ,),
                SizedBox(height: 60,),
                ElevatedButton(onPressed: (){_uploadFile();}, child: Text('ارسال التقرير'),style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(primaryColor))),

              ],
            )
        )
    );
  }


  void datePicker() async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.black, // button text color
                ),
              ),
            ),
            child: child,

          );
        });
    if(pickedDate != null)
    {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dateInput.text = formattedDate;
      });
    }



  }


/*
  List<DropdownMenuItem<String>> get dropdownItems{
    [
      DropdownMenuItem(child: Text("USA"),value: "USA"),
      DropdownMenuItem(child: Text("Canada"),value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
      DropdownMenuItem(child: Text("England"),value: "England"),
    ]

    return menuItems;
  }

*/


}

