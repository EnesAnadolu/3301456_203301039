
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileOperations extends StatefulWidget {
  const FileOperations({Key? key}) : super(key: key);

  @override
  State<FileOperations> createState() => _FileOperationsState();
}

class _FileOperationsState extends State<FileOperations> {
  TextEditingController controller = TextEditingController();
  var gosterilecekDeger = "";
  var key = GlobalKey();

  Future<String> get getDirectoryPath async {
    //döküman kaydetme konumunu(path) oluşturduk.
    Directory file = await getApplicationDocumentsDirectory();
    return file.path;
  }

  Future get createFile async {
    var filePath = await getDirectoryPath;
    return File(filePath + '/dosyaismi.txt');
  }

  Future writeToFile(String contents) async {
    var myFile = await createFile;
    return myFile.writeAsString(contents);
  }

  Future<String> readFile() async {
    try {
      var myDosya = await createFile;
      String dosyaicergi = myDosya.readAsStringSync();
      return dosyaicergi;
    } catch (exception) {
      return ("HATA :$exception");
    }
  }

  void _Write() async {
    writeToFile(controller.text.toString()).then((value) {
      setState(() {
        gosterilecekDeger = value.toString();
      });
    });
  }

  void _Read() async {
    readFile().then((String deger) {
      setState(() {
        gosterilecekDeger = deger;
        debugPrint("$gosterilecekDeger");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBar(
          title: Text("Dosya işlemleri"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText:
                        "Buraya yazılacak degerler dosya ya kaydedilir",
                        hintStyle: TextStyle(
                            letterSpacing: 2,
                            fontSize: 15,
                            color: Colors.orange,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: _Write,
                        color: Colors.green,
                        child: Text("Dosya'ya Yaz"),
                      ),
                      MaterialButton(
                        onPressed: _Read,
                        color: Colors.orange,
                        child: Text("Dosya'dan oku"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text("$gosterilecekDeger"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
