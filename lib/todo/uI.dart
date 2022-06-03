import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<PlatformFile> _files;
  bool isLoadedImage ;

  @override
  void initState() {
    super.initState();
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

    isLoadedImage = true;
    print('Loaded file path is : ${_files.first.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('File Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           !isLoadedImage?ElevatedButton(onPressed: _openFileExplorer, child: Text('Open File Explorer')):Container(color: Colors.redAccent,width: 50,),
            ElevatedButton(onPressed: _uploadFile, child: Text('Upload File')),
            ElevatedButton(onPressed: (){
              setState(() {
              isLoadedImage = !isLoadedImage;
            });}, child: Text('change state'))

          ],
        ),
      ),
    );
  }
}