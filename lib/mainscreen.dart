import 'package:flutter/material.dart';
import 'package:google_sheet/sheet_google.dart';
import 'package:google_sheet/sheetscolumn.dart';
import 'package:google_sheet/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController deptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Google Sheet",
                style: myText(),
              ),
              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller: nameController,
                decoration: myStyle("Name"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: idController,
                decoration: myStyle("Id"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: deptController,
                decoration: myStyle("Department"),
              ),
              const SizedBox(
                height: 15,
              ),

              // Button ......
              ElevatedButton(
                  onPressed: () async {
                    // final dataCollection = {
                    //   SheetsColumn.name: nameController.text.trim(),
                    //   SheetsColumn.id: idController.text.trim(),
                    //   SheetsColumn.dept: deptController.text.trim(),
                    // };
                    
                    final dataCollection = User(
                        name: nameController.text.trim(),
                        id: idController.text.trim(),
                        dept: deptController.text.trim());
                    // Data Inserted to Google Sheet
                    await SheetGoogle.insert([dataCollection.toJson()]);
                    //=====================================
                    nameController.clear();
                    idController.clear();
                    deptController.clear();
                  },
                  style: myDesign(),
                  child: const Text("Send to Sheet")),
            ],
          ),
        ),
      ),
    );
  }
}
