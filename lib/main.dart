import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'idade_x',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: AgeCalculator(),
    );
  }
}

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  TextEditingController _dobController = TextEditingController();
  String _result = '';

  void calculateAge() {
    String dob = _dobController.text;
    DateTime currentDate = DateTime.now();
    
    DateTime birthDate = DateFormat('dd/MM/yyyy').parse(dob);

    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }

    setState(() {
      _result = 'Você tem  $age anos';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descubra sua idade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                labelText: 'Digite sua data de Nascimento (dd/mm/aaaa)',
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15), // Ajuste o espaçamento interno
                isDense: true, // Torna o TextField mais compacto
                border: OutlineInputBorder(), // Adicione uma borda para delimitar a caixa de entrada
              ),
              style: TextStyle(fontSize: 16), // Ajuste o tamanho da fonte
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: calculateAge,
              child: Text('Calcular Idade'),
            ),
            SizedBox(height: 15),
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
