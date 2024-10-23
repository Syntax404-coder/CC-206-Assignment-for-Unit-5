import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 126, 207, 173)),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int addResult = 0;
  int subResult = 0;
  int mulResult = 0;
  int divResult = 0;

  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();

  TextEditingController sub1Controller = TextEditingController();
  TextEditingController sub2Controller = TextEditingController();

  TextEditingController mul1Controller = TextEditingController();
  TextEditingController mul2Controller = TextEditingController();

  TextEditingController div1Controller = TextEditingController();
  TextEditingController div2Controller = TextEditingController();

  void performAddition() {
    setState(() {
      int num1 = int.parse(add1Controller.text);
      int num2 = int.parse(add2Controller.text);
      addResult = num1 + num2;
    });
  }

  void performSubtraction() {
    setState(() {
      int num1 = int.parse(sub1Controller.text);
      int num2 = int.parse(sub2Controller.text);
      subResult = num1 - num2;
    });
  }

  void performMultiplication() {
    setState(() {
      int num1 = int.parse(mul1Controller.text);
      int num2 = int.parse(mul2Controller.text);
      mulResult = num1 * num2;
    });
  }

  void performDivision() {
    setState(() {
      int num1 = int.parse(div1Controller.text);
      int num2 = int.parse(div2Controller.text);
      divResult = num1 ~/ num2; //round
    });
  }

  void clearAll() {
    setState(() {
      add1Controller.clear();
      add2Controller.clear();
      sub1Controller.clear();
      sub2Controller.clear();
      mul1Controller.clear();
      mul2Controller.clear();
      div1Controller.clear();
      div2Controller.clear();

      addResult = 0;
      subResult = 0;
      mulResult = 0;
      divResult = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double operatorFontSize = 30.0; // Operator font size
    double resultFontSize = 25.0;   // Answer font size

    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 500, 
                    child: TextField(
                      controller: add1Controller,
                      decoration: const InputDecoration(labelText: "First Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Text(
                  " + ",
                  style: TextStyle(fontSize: operatorFontSize), 
                ),
                Flexible(
                  child: SizedBox(
                    width: 500, 
                    child: TextField(
                      controller: add2Controller,
                      decoration: const InputDecoration(labelText: "Second Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Text(
                  " = $addResult",
                  style: TextStyle(fontSize: resultFontSize), 
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: performAddition,
                ),
              ],
            ),

            // Subtract Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 500, 
                    child: TextField(
                      controller: sub1Controller,
                      decoration: const InputDecoration(labelText: "First Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Text(
                  " - ",
                  style: TextStyle(fontSize: operatorFontSize), 
                ),
                Flexible(
                  child: SizedBox(
                    width: 500, 
                    child: TextField(
                      controller: sub2Controller,
                      decoration: const InputDecoration(labelText: "Second Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Text(
                  " = $subResult",
                  style: TextStyle(fontSize: resultFontSize),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: performSubtraction,
                ),
              ],
            ),

            // Multiplication Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SizedBox(
                    width:500, 
                    child: TextField(
                      controller: mul1Controller,
                      decoration: const InputDecoration(labelText: "First Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Text(
                  " * ",
                  style: TextStyle(fontSize: operatorFontSize), 
                ),
                Flexible(
                  child: SizedBox(
                    width: 500, 
                    child: TextField(
                      controller: mul2Controller,
                      decoration: const InputDecoration(labelText: "Second Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Text(
                  " = $mulResult",
                  style: TextStyle(fontSize: resultFontSize), 
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: performMultiplication,
                ),
              ],
            ),

            // Division Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 500, 
                    child: TextField(
                      controller: div1Controller,
                      decoration: const InputDecoration(labelText: "First Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Text(
                  " ÷ ",
                  style: TextStyle(fontSize: operatorFontSize), 
                ),
                Flexible(
                  child: SizedBox(
                    width: 500, 
                    child: TextField(
                      controller: div2Controller,
                      decoration: const InputDecoration(labelText: "Second Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Text(
                  " = $divResult",
                  style: TextStyle(fontSize: resultFontSize), 
                ),
                IconButton(
                  icon: const Text('÷'),
                  onPressed: performDivision,
                ),
              ],
            ),

            // Clear all inputs and results
            ElevatedButton(
              onPressed: clearAll,
              child: const Text("Clear All"),
            ),
          ],
        ),
      ),
    );
  }
}
