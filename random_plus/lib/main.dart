import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Plus Game',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Random plus game!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  int counter2 = 0;
  int count = 0;
  final TextEditingController controller = TextEditingController();

  void randomnum() {
    var rng = Random().nextInt(100);
    setState(() {
      counter = rng;
    });
    var rng2 = Random().nextInt(100);
    setState(() {
      counter2 = rng2;
    });
    print('rng1: $rng');
    print('rng2: $rng2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: const Text(
                    'This is Infinity Plus Game!',
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Image(
                    image: AssetImage('images/infinite.png'), height: 150),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$counter',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        child: Text(
                      '+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    )),
                    Text(
                      '$counter2',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        labelText: '=', labelStyle: TextStyle(fontSize: 30)),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ButtonTheme(
                  minWidth: 100,
                  height: 50,
                  child: ElevatedButton(
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 55,
                    ),
                    onPressed: () {
                      if (controller.text == '${counter + counter2}') {
                        randomnum();
                        controller.clear();
                        print('맞습니다.');
                      } else {
                        showToast('ㅋㅋ응 틀렸쥬?ㅋㅋ');
                        print('틀렸습니다.');
                        count++;
                      }
                      if(count >= 3){
                        showToast('븅신 $count 번이나 틀리냐 ㅋㅋ');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: randomnum,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}
