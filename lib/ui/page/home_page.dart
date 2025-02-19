import 'package:flutter/material.dart';

import '../widget/w1.dart';
import '../widget/w2.dart';
import '../widget/w3.dart';

class MyHomePage extends StatefulWidget {
  // La única clase que tiene estado
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _value = 0.0;

  void _updateValue(double amount) {
    setState(() {
      _value = double.parse((_value + amount).toStringAsFixed(1));
    });
  }

  void _resetValue() {
    setState(() {
      _value = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => _resetValue(),
                  icon: const Icon(Icons.refresh),
                  key: const Key('Refresh'),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  W1(
                    // Se puede llamar a la clase W1 con parámetros
                    value: _value,
                    onAdd: () => _updateValue(0.1),
                    onSubtract: () => _updateValue(-0.1),
                  ),
                  W2( 
                    // Se puede llamar a la clase W2 con parámetros
                    value: _value,
                  ),
                  W3(
                    value: _value,
                    onAdd: () => _updateValue(1),
                    onSubtract: () => _updateValue(-1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
