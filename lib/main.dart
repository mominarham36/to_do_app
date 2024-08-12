import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController task = TextEditingController();
  List<String> _arr = [];
  bool disableButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    task.addListener(() {
      setState(() {
        if (task.text.isEmpty || task.text.trim() == '') {
          disableButton = false;
        } else {
          disableButton = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final reverseArr = _arr.reversed.toList();
    void changeState() {
      setState(() {
        if (task.text.length > 0) {
          _arr.insert(0, task.text.toString());
          task.clear();
        }
        // else{
        //   errorMsg = 'task cannot be empty';
        // }
        // print('arrrrrrrr$_arr');
      });
    }

    void removeElment(index) {
      setState(() {
        _arr.removeAt(index);
      });
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'To-do App',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              backgroundColor: Colors.redAccent,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: 200,
                    width: double.infinity,
                    // color: Colors.blueGrey,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Container(
                            // height: 50,
                            width: 220,
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                              controller: task,
                              decoration: InputDecoration(
                                  // errorText: errorMsg,
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'please add task',
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  fillColor:
                                      Color.fromRGBO(214, 214, 214, 0.962),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            height: 47,
                            width: 90,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: Colors.red),
                              onPressed: disableButton == false
                                  ? null
                                  : () {
                                      changeState();
                                    },
                              child: Text(
                                'add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: _arr.length == 0
                        ? Center(
                            child: Text('No tasks available',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )))
                        : ListView.builder(
                            // reverse: true,
                            itemCount: _arr.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: 300,
                                  color: Colors.grey[200],
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _arr[index],
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              removeElment(index);
                                            },
                                            icon: Icon(Icons.close),
                                            color: Colors.red,
                                            iconSize: 40,
                                          )
                                        ]),
                                  ),
                                ),
                              );
                              // return Padding(
                              //   padding: const EdgeInsets.only(top: 10),
                              //   child: ListTile(
                              //     title: Text(
                              //       _arr[index],
                              //       style: TextStyle(
                              //         fontSize: 18,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.black,
                              //       ),
                              //     ),
                              //     tileColor: Colors.grey[200],
                              //   ),
                              // );
                            },
                          ),
                  ),
                ],
              ),
            )));
  }
}
